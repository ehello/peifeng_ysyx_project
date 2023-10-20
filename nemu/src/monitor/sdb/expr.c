/***************************************************************************************
* Copyright (c) 2014-2022 Zihao Yu, Nanjing University
*
* NEMU is licensed under Mulan PSL v2.
* You can use this software according to the terms and conditions of the Mulan PSL v2.
* You may obtain a copy of Mulan PSL v2 at:
*          http://license.coscl.org.cn/MulanPSL2
*
* THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
* EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
* MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
*
* See the Mulan PSL v2 for more details.
***************************************************************************************/

#include <isa.h>
#include <memory/vaddr.h>
/* We use the POSIX regex functions to process regular expressions.
 * Type 'man regex' for more information about POSIX regex functions.
 */
#include <regex.h>

#define UNUSED(x) (void)(x)
int tokens_num=0; //放一个全局变量记录token的个数
enum {
  TK_NOTYPE = 256, TK_EQ,
  TK_NUM=1,TK_POINT=2,
  TK_NEG=3,TK_AND=4,
  TK_NEQ=5,TK_OR=6,
  TK_REG=7,TK_HEX=8,
  /* TODO: Add more token types */

};

static struct rule {
  const char *regex;
  int token_type;
} rules[] = {

  /* TODO: Add more rules.
   * Pay attention to the precedence level of different rules.
   */
  {"\\)", ')'},         // right_bracket
  {"\\(", '('},         // left_bracket
  {"\\/", '/'},         // divide
  {"\\*", '*'},         // multiply
  {"\\-", '-'},         // minus
  {"\\+", '+'},         // plus
  {" +", TK_NOTYPE},    // spaces
  {"\\=\\=", TK_EQ},        // equal
  {"\\&\\&", TK_AND},       // && 和
  {"\\|\\|", TK_OR},         // || 与 
  {"\\!\\=", TK_NEQ},       // not equal 不等于
  {"[0-9]*",TK_NUM},    // num  //"\\d+"不管用
  {"0[xX][0-9a-fA-F]+",TK_HEX}, //识别32位类型
  {"\\$[a-zA-Z]*[0-9]*", TK_REG}, //识别寄存器类型,特殊0号寄存器是$0永远是0不用处理
};

#define NR_REGEX ARRLEN(rules)

static regex_t re[NR_REGEX] = {};

/* Rules are used for many times.
 * Therefore we compile them only once before any usage.
 */
void init_regex() {
  int i;
  char error_msg[128];
  int ret;

  for (i = 0; i < NR_REGEX; i ++) {
    ret = regcomp(&re[i], rules[i].regex, REG_EXTENDED);
    if (ret != 0) {
      regerror(ret, &re[i], error_msg, 128);
      panic("regex compilation failed: %s\n%s", error_msg, rules[i].regex);
    }
  }
}



typedef struct token {
  int type;
  char str[32];
} Token;

static Token tokens[10000] __attribute__((used)) = {};
static int nr_token __attribute__((used))  = 0;

bool check_parentheses(int p,int q){
  if(tokens[p].type!='('||tokens[q].type!=')') return false;
  int i=0;
  int left_c=0;
  int flag=0;
  for(i=p;i<=q;i++){
    if(tokens[i].type=='('){
      left_c++;
    }else if(tokens[i].type==')'){
      left_c--;
    }
    if(left_c==0&&i!=q) flag=1;
  }
  if(flag==1) return false;
  else return true;
} //括号匹配算法,注意坑((1+1)*2)与(1+1)*(1+1)后者不能直接去掉两边括号

int prio(int t){ //优先级排序,很重要!!!
  switch (t) {
      case '+':
      case '-':
          return 5;
      case '*':
      case '/':
          return 4;
      case TK_NEG:
          return 3;
      case TK_POINT:
          return 2;
      case TK_EQ:
      case TK_NEQ:
          return 1;
      default:
          return 0;
  }
}

word_t eval(int p,int q) {
  if (p > q) {
    assert(0);
    return -1;
    /* Bad expression */
  }
  else if (p == q) {
    /* Single token.
     * For now this token should be a number.
     * Return the value of the number.
     */
    return atoi(tokens[p].str);
  }
  else if (check_parentheses(p, q) == true) {
    /* The expression is surrounded by a matched pair of parentheses.
     * If that is the case, just throw away the parentheses.
     */
    return eval(p + 1, q - 1);
  }
  else {
//    op = the position of 主运算符 in the token expression;
    int op=0;
    int pr=-1;
    int i,j;
    int val1=1;
    for(i=p;i<=q;i++){
      if(tokens[i].type=='('){ //
        for(j=i+1;j<=q;j++){
          if(tokens[j].type==')'){
            i=j;
            break;
          }
        }
      }
      if(tokens[i].type==TK_NUM||tokens[i].type==TK_NOTYPE||tokens[i].type==TK_HEX||tokens[i].type==TK_REG){
        continue;
      }else if(prio(tokens[i].type)>pr){ //pr是当前最高优先级
        pr=prio(tokens[i].type);
        op=i;
      }
    }
    
    
    if(tokens[op].type!=TK_NEG||tokens[op].type!=TK_POINT){
      val1 = eval(p, op - 1);
    }
    word_t val2 = eval(op + 1, q);

    switch (tokens[op].type) {
      case '+': return val1 + val2;
      case '-': return val1 - val2;
      case '*': return val1 * val2;
      case '/': return val1 / val2;
      case TK_NEG: return -1*val2;
      case TK_EQ:
        if(val1==val2) return 1;
        else return 0;
      case TK_NEQ:
        if(val1!=val2) return 1;
        else return 0;
      case TK_AND: return val1&&val2;
      case TK_POINT: return vaddr_read(val2,4);
      default: assert(0);
    }
  }
}

static bool make_token(char *e) {
  int position = 0;
  int i;
  regmatch_t pmatch;
  memset(tokens, 0, sizeof(tokens));
  nr_token = 0;

  while (e[position] != '\0') {
    /* Try all rules one by one. */
    for (i = 0; i < NR_REGEX; i ++) {
      if (regexec(&re[i], e + position, 1, &pmatch, 0) == 0 && pmatch.rm_so == 0) {
        // char *substr_start = e + position;
        int substr_len = pmatch.rm_eo;

        // Log("match rules[%d] = \"%s\" at position %d with len %d: %.*s",
        //     i, rules[i].regex, position, substr_len, substr_len, substr_start);

        position += substr_len;

        /* TODO: Now a new token is recognized with rules[i]. Add codes
         * to record the token in the array `tokens'. For certain types
         * of tokens, some extra actions should be performed.
         */
        switch (rules[i].token_type) {
          case '(':
            tokens[nr_token++].type='(';
            break;
          case ')':
            tokens[nr_token++].type=')';
            break;
          case '/':
            tokens[nr_token++].type='/';
            break;
          case '*':
            tokens[nr_token++].type='*';
            break;
          case '-':
            tokens[nr_token++].type='-';
            break;
          case '+':
            tokens[nr_token++].type='+';
            break;
          case TK_NOTYPE:
            break;
          case TK_AND:
            tokens[nr_token++].type=TK_AND;
            break;
          case TK_OR:
            tokens[nr_token++].type=TK_OR;
            break;
          case TK_NEQ:
            tokens[nr_token++].type=TK_NEQ;
            break;
          case TK_EQ:
            tokens[nr_token++].type=TK_EQ;
            break;
          case TK_NUM:
            tokens[nr_token].type=TK_NUM;
            strncpy(tokens[nr_token++].str,&e[position-substr_len],substr_len);
            break;
          case TK_HEX:
            tokens[nr_token].type=TK_HEX;
            strncpy(tokens[nr_token++].str,&e[position-substr_len],substr_len);
            break;
          case TK_REG:
            tokens[nr_token].type=TK_REG;
            strncpy(tokens[nr_token++].str,&e[position-substr_len],substr_len);
            break;
            // tokens[nr_token++].str='1';
          default: TODO();
        }
        
        break;
      }
      
    }
    
    if (i == NR_REGEX) {
      printf("no match at position %d\n%s\n%*.s^\n", position, e, position, "");
      return false;
    }
  }
  tokens_num=nr_token;
  return true;
}


word_t expr(char *e, bool *success) {
  if (!make_token(e)) {
    *success = false;
    return 0;
  }
  int i;
  for (i=0;i<tokens_num;i++) {
    if (tokens[i].type == '-' && ( i == 0 || (tokens[i - 1].type!=')'&&tokens[i - 1].type != TK_NUM&&tokens[i].type==TK_HEX&&tokens[i].type==TK_REG)) ) {
      tokens[i].type = TK_NEG;
    }
    if (tokens[i].type == '*' && ( i == 0 || (tokens[i - 1].type!=')'&&tokens[i - 1].type != TK_NUM&&tokens[i].type==TK_HEX&&tokens[i].type==TK_REG)) ) {
      tokens[i].type = TK_POINT;
    }
    if (tokens[i].type == TK_REG){
        bool flag=true; 
        word_t reg_v=isa_reg_str2val(tokens[i].str,&flag);
        if(flag==false) Log("load reg: %s error",tokens[i].str);
        sprintf(tokens[i].str,"%u",reg_v);
    }
  }
  /* TODO: Insert codes to evaluate the expression. */
  // printf("nr_token= %d\n",tokens_num);
  return eval(0,tokens_num-1);
  // printf("%d\n",tokens);
  // TODO();

  // return 0;
}
