void parse_line2(char *line, int len)
{
  struct inst inst = {};
  struct as as = {};

  // TODO: LABELS
  // TODO: COMMENTS
  // TODO: NO LIMITS, IF THE VALUE IS OUT OF BOUNDS EMIT MULTIPLE INSTRUCTIONS
  char *tok;
  int tok_len;

repeat:
  while(len > 0 && isspace(*line)) {
    line++; len--;
  }
  if(len == 0 || *line == '#')
    goto exit;
  
  printf("parse: %.*s\n", len - 1, line);


  struct arg label = {};
  int toklen = get_label(&label, line, len);
  if(toklen && toklen < len && line[toklen] == ':') {
    goto repeat;
  }

  char *opcode = gettok(&line, &len, 0);
  int opcode_len = line - opcode; 

  //if(parse_label(opcode, opcode_len) == 0) {
  //  //current_label = &labels[labelidx - 1];
  //  goto repeat;
  //}

  struct inst_desc *desc = opcode_map;
  for(; desc->opcode; ++desc) { 
    //printf("OPCODE: %.*s %s\n", opcode_len, opcode,  desc->opcode);
    if(opcode_len != desc->opcode_len)
      continue;

    if(memcmp(opcode, desc->opcode, desc->opcode_len))
      continue;

    for(int i = 0; i < MAX_ARG; ++i) {
      if(getarg(&as.a[i], &line, &len))
        break;
    }
    //printf("A0"); print_arg(as.a + 0); puts("");
    //printf("A1"); print_arg(as.a + 1); puts("");
    //printf("A2"); print_arg(as.a + 2); puts("");

    as.desc = desc;
    do_emit_inst(desc, as.a + 0, as.a + 1, as.a + 2);
    goto exit;

#if 0
    if(desc->type & INST_A) { 
      tok = gettok(&line, &len, ',');
      as.a[0].type = ARG_REG;
      as.a[0].value = parse_reg(tok, line - tok);

      if(desc->type & INST_B) {
        tok = gettok(&line, &len, 0);
        if(line - tok != 1 || tok[0] != ',')
          fail("Forgot a comma"); 

        tok = gettok(&line, &len, ',');
        as.a[1].type = ARG_REG;
        as.a[1].value = parse_reg(tok, line - tok);

        if(desc->type & INST_C) {
          tok = gettok(&line, &len, 0);
          as.a[2].type = ARG_REG;
          if(line - tok != 1 || tok[0] != ',')
            fail("Forgot a comma"); 

          tok = gettok(&line, &len, ',');
          as.a[2].value = parse_reg(tok, line - tok);

        } else if(desc->type & INST_IMM) {
          tok = gettok(&line, &len, 0);
          as.a[2].type = ARG_IMM;
          if(line - tok != 1 || tok[0] != ',') {
            as.a[2].value = 0;
          } else {
            tok = gettok(&line, &len, '#');
            as.a[2].value = parse_imm(tok, line - tok);
            //printf("IMM %d\n", parse_imm(tok, line - tok));
          }
        }
      } else if(desc->type & INST_IMM) {
        tok = gettok(&line, &len, 0);
        as.a[1].type = ARG_IMM;
        if(line - tok != 1 || tok[0] != ',') {
          as.a[1].value = 0;
        } else {
          tok = gettok(&line, &len, '#');
          as.a[1].value = parse_imm(tok, line - tok);
          //printf("IMM %d\n", parse_imm(tok, line - tok));
        }
      }
    } else if (desc->type & INST_DATA) {
      // TODO: allow .fill a, b syntax
      tok = gettok(&line, &len, 0);
      as.a[0].type = ARG_IMM;
      if(desc->op == DOP_PAD) {
        as.a[0].value = parse_imm(tok, line - tok);
      } else if (desc->op == DOP_DW) {
        as.a[0].value = parse_imm(tok, line - tok);
      } else {
        fail("");
      }
    }
// #else
    switch(as->desc->type) {
    case INST_A_IMM:
      /* A */
      tok = gettok(&line, &len, ',');
      as.a[0].type = ARG_REG;
      as.a[0].value = parse_reg(tok, line - tok);
      /* COMMA */
      tok = gettok(&line, &len, 0);
      if(line - tok != 1 || tok[0] != ',')
        fail("Forgot a comma"); 
      /* IMMEDIATE */
      tok = gettok(&line, &len, '#');
      as.a[1].type = ARG_IMM;
      as.a[1].value = parse_imm(tok, line - tok, IMM_MAX);
      break;
    case INST_AB_IMM:
      /* A */
      tok = gettok(&line, &len, ',');
      as.a[0].type = ARG_REG;
      as.a[0].value = parse_reg(tok, line - tok);
      /* COMMA */
      tok = gettok(&line, &len, 0);
      if(line - tok != 1 || tok[0] != ',')
        fail("Forgot a comma"); 
      /* B */
      tok = gettok(&line, &len, ',');
      as.a[1].type = ARG_REG;
      as.a[1].value = parse_reg(tok, line - tok);
      /* COMMA */
      tok = gettok(&line, &len, 0);
      if(line - tok != 1 || tok[0] != ',')
        fail("Forgot a comma"); 
      /* IMMEDIATE */
      tok = gettok(&line, &len, '#');
      as.a[2].type = ARG_IMM;
      as.a[2].value = parse_imm(tok, line - tok, IMM_MAX);
      break;
    case INST_ABC:
      /* A */
      tok = gettok(&line, &len, ',');
      as.a[0].type = ARG_REG;
      as.a[0].value = parse_reg(tok, line - tok);
      /* COMMA */
      tok = gettok(&line, &len, 0);
      if(line - tok != 1 || tok[0] != ',')
        fail("Forgot a comma"); 
      /* B */
      tok = gettok(&line, &len, ',');
      as.a[1].type = ARG_REG;
      as.a[1].value = parse_reg(tok, line - tok);
      /* COMMA */
      tok = gettok(&line, &len, 0);
      if(line - tok != 1 || tok[0] != ',')
        fail("Forgot a comma"); 
      /* IMMEDIATE */
      tok = gettok(&line, &len, '#');
      as.a[2].type = ARG_IMM;
      as.a[2].value = parse_imm(tok, line - tok, IMM_MAX);
      break;
      break;
    case INST_DATA:
    default:
      fail("Unknown instruction type");
    }
#endif
  }
  fail("Unknown opcode");
exit:

  return;
}


