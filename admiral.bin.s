�����   interpreter_main    interpreter_loop    interpreter_loop_parse ,  scope_get H  scope_del i  scope_set �  scope_set_no_parent �  scope_set_insert � 
 recover �  global_scope 
 current_scope 
 recovery_fp 
 recovery_sp 
	 cursor 
 keyboard 

 monitor 
 clock 
 heap_start 
 heap_end 
 heap_free_start 
 heap_handle_start 
 heap_zero 
 heap_free_list 
 heap_alloc_counter 
 lexer_string 
 lexer_target_indent 
 lexer_current_indent 
 lexer_token 
 lexer_start 
 lexer_end 
 buf_start 

 buf_end 
 gap_start 

 gap_end 
 win_start 
 win_shift 

 cur_pos 
 cur_line 
 cur_x 
 cur_y 
 prev_char 
 STR_UNDERSCORE 
	 STR_EX 
	 STR_ME 
 STR_TRUE 
 STR_FALSE 
 STR_ERROR 
 STR_PROMPT 
 STR_EMPTY 
 NONE 
 BOOL_HANDLE_FALSE 
 BOOL_HANDLE_TRUE 
 INT_HANDLE_N1 
 INT_HANDLE 
 INT_HANDLE_0 
 INT_HANDLE_1 
 INT_HANDLE_2 
 INT_HANDLE_3 
 INT_HANDLE_4 
 INT_HANDLE_5 
 INT_HANDLE_6 
 INT_HANDLE_7 
 INT_HANDLE_8 
 INT_HANDLE_9 
 INT_HANDLE_10 
 INT_HANDLE_11 
 INT_HANDLE_12 
 INT_HANDLE_13 
 INT_HANDLE_14 
 INT_HANDLE_15 
 INT_HANDLE_16 
 INT_VALUE_N1 
 INT_VALUE_0 
 INT_VALUE_1 
 INT_VALUE_2 
 INT_VALUE_3 
 INT_VALUE_4 
 INT_VALUE_5 
 INT_VALUE_6 
 INT_VALUE_7 
 INT_VALUE_8 
 INT_VALUE_9 
 INT_VALUE_10 
 INT_VALUE_11 
 INT_VALUE_12 
 INT_VALUE_13 
 INT_VALUE_14 
 INT_VALUE_15 
 INT_VALUE_16 
 token_eof 
 token_newline 
 token_indent 
 token_dedent 
 token_int 
 token_float 
 token_name 
 token_str 
 token_none 
 token_true 
 token_false 
 token_tilde 
 token_if 
 token_cls 
 token_del 
 token_for 
 token_elif 
 token_else 
 token_pass 
 token_print 
 token_while 
 token_break 
 token_reset 
 token_return 
 token_continue 
 token_assign 
 token_augass_plus 
 token_augass_minus 
 token_augass_star 
 token_augass_slash 
 token_augass_percent 
 token_augass_or 
 token_augass_xor 
 token_augass_and 
 token_augass_lshift 
 token_augass_rshift 
 token_cond_assign 
 token_prototype 
 token_comma 
 token_colon 
 token_or 
 token_and 
 token_in 
 token_not 
 token_is 
 token_equal 
 token_less 
 token_less_or_equal 
 token_greater 
 token_greater_or_equal 
 token_not_equal 
 token_bitwise_or 
 token_bitwise_xor 
 token_bitwise_and 
 token_lshift 
 token_rshift 
 token_plus 
 token_minus 
 token_star 
 token_slash 
 token_percent 
 token_power 
 token_lbrack 
 token_rbrack 
 token_lparen 
 token_rparen 
 token_lcurly 
 token_rcurly 
 token_reference 
 lexer_table 
 parser_stmt 
 parser_simple_stmt  std_newline ,
 std_eof . std_indent 2 std_dedent 2
 std_cls 4 std_reset ? std_print J std_print_loop L std_print_array k std_print_iterator y std_print_break_newline � std_print_break_eof � std_return � std_return_finish � std_break � std_continue � std_pass �
 std_for � std_for_loop � std_for_execute_suite 	 std_for_control_continue  std_for_loop_string  std_for_loop_string_tuple   std_for_control & std_for_control_break 8 std_for_finish : std_for_eof < std_for_control_return >
 std_del C std_del_loop E std_del_break U	 std_if Y std_if_skip_loop } std_if_skip � std_if_false � std_if_else � std_if_eof � parser_fork_scope � std_while � std_while_loop � std_while_control_continue � std_while_control � std_while_control_break � std_while_false  std_while_eof  std_while_control_return  parser_skip_until_token ! parser_skip_until_token_finish  parser_skip_suite   parser_skip_suite_simple_stmt (' parser_skip_suite_simple_stmt_finish , parser_skip_suite_block 0 parser_skip_suite_block_loop 8 parser_suite J parser_suite_simple_stmt U parser_suite_block Y parser_suite_block_loop _ parser_suite_block_break r std_expression v expression | expr_loop � expression_callback � expr_finish � testlist � testlist_loop � testlist_callback �
 nud_int �
 nud_str � nud_name � nud_none  nud_true 	 nud_false  nud_lparen  nud_lparen_empty 4 nud_lbrack > nud_lbrack_change_type f nud_lbrack_continue k nud_lbrack_empty s nud_lcurly } nud_lcurly_loop � nud_lcurly_finish � nud_plus � nud_minus � nud_minus_int � nud_tilde � nud_tilde_int 
 nud_not 
 led_and 6	 led_or L boolean_operator b	 led_is � led_is_not �
 led_not �	 led_in � led_in_1 � led_in_string � led_in_dict  led_in_list  led_in_found  led_in_not_found ! led_less_or_equal ) led_less 9 led_greater_or_equal I led_greater Y led_not_equal i led_equal y compare_operator � led_plus � led_plus_operation � led_minus � led_minus_operation � led_star � led_star_operation � led_power 	 led_power_operation 	 led_bitwise_or $	 led_bitwise_or_operation 0	 led_bitwise_xor 9	 led_bitwise_xor_operation E	 led_bitwise_and N	 led_bitwise_and_operation Z	 led_lshift c	 led_lshift_operation o	 led_rshift x	 led_rshift_operation �	 led_slash �	 led_slash_operation �	 led_percent �	 led_percent_operation �	 led_assign �	 led_cond_assign �	 led_prototype �	 led_augass_lshift -
 led_augass_rshift @
 led_augass_or S
 led_augass_xor f
 led_augass_and y
 led_augass_plus �
 led_augass_minus �
 led_augass_star �
 led_augass_slash �
 led_augass_percent �
 led_lparen �
 led_lparen_user_defined �
 led_lparen_args  led_lparen_prepare_call * led_lparen_call D led_lparen_finish R led_lparen_control Z parse_testlist_item g parse_testlist_item_assign � parse_testlist_item_set � led_lbrack � led_lbrack_parse_first � led_lbrack_after_colon � led_lbrack_empty_after_colon � led_lbrack_dict 	 led_lbrack_finish  led_reference 2	 infixr d infix m
 infix_1 q led_comma � led_comma_add � led_comma_end � built_in � built_in_2 � built_in_3 � built_in_4 @ built_in_5 l built_in_6 � built_in_7 � built_in_id � built_in_input � built_in_range � built_in_range_2 � built_in_range_3 � built_in_range_loop  built_in_range_break ) built_in_locals - built_in_globals 7 built_in_cmp A built_in_chr Z built_in_ord { built_in_edit � built_in_abs � built_in_len � built_in_int � built_in_int_int � built_in_int_bool � built_in_int_string � built_in_repr � built_in_str  built_in_bool  built_in_params ) built_in_params_loop + built_in_params_end F lexer_init K lexer_store _ lexer_restore m lexer_get_token_as_string � lexer_advance � lexer_next � lexer_finish_advance � lexer_finish � lexer_char_newline � lexer_char_newline_restart � lexer_char_newline_loop � lexer_char_newline_break � lexer_indent � lexer_dedent � lexer_char_dot � lexer_char_tilde � lexer_char_colon � lexer_char_questionmark  lexer_char_comma  lexer_char_lparen  lexer_char_rparen  lexer_char_lcurly  lexer_char_rcurly $ lexer_char_lbrack ) lexer_char_rbrack . lexer_char_plus 3 lexer_char_minus : lexer_char_star A lexer_char_star_assign R lexer_char_star_star W lexer_char_caret \ lexer_char_vbar c lexer_char_ambersand j lexer_char_slash q lexer_char_percent x lexer_char_equal  lexer_char_less � lexer_char_less_less � lexer_char_greater � lexer_char_greater_greater � lexer_char_exclamation � check_augass � lexer_char_eof � lexer_char_digit � lexer_char_letter � lexer_char_letter_uc � lexer_char_letter_lc � lexer_name_loop   lexer_name_general 2 lexer_name_finish 4 lexer_name_2 8 lexer_name_3 b lexer_name_4 � lexer_name_5 � lexer_name_6 X lexer_name_8 p lexer_char_quotationmark � lexer_literal_string_loop � lexer_float � lexer_skip_white � lexer_skip_comment � lexer_char_whitespace � lexer_char_comment �
 val_cmp � valcmp_address � valcmp_type � eval  eval_name ) eval_tuple 4 eval_tuple_loop 9 eval_tuple_break F eval_reference J eval_subscription S eval_subscription_dict n eval_subscription_array t  eval_subscription_array_index � eval_subscription_str_slice �  eval_subscription_array_slice � eval_subscription_str � eval_subscription_str_index �
 boolean � boolean_true � boolean_false � boolean_str � sort � sort_string � char_comparator  char_reverse_comparator  sort_array & array_comparator 3 array_comparator_true > array_reverse_comparator A	 assign L assign_subscription r assign_subscription_list_int � assign_subscription_dict � assign_reference �( assign_reference_or_subscription_dict � assign_name � assign_tuple � assign_tuple_loop � assign_tuple_break � assign_from_string � del � del_name  postamble ( preamble = preamble_init_local I print_repr O print W print_with_repr d print_skip_repr k print_loop m repr z repr_string � repr_boolean � detect_hardware �	 hwloop � init_monitor � win_show_cursor � win_hide_cursor � show_cursor � hide_cursor � win_move � win_getchar  win_getchar_test_key + win_getchar_ctrl 6 win_getchar_ctrl_loop 6 win_getchar_release S win_getchar_release_loop T add_char ] add_char_newline p add_char_scroll t add_char_copy � add_char_clear � add_char_finish � add_char_backspace � cls � cls_loop � cls_finish � raw_input � raw_input_no_prompt � next_char_loop � input_loop �	 finish � finish_loop � create_heap �
 realloc  alloc 9 alloc_restart P alloc_check_space b alloc_init_memory t alloc_finish ~ alloc_gc � mark_and_compact � mac_process_frame � mac_loop_references � mac_next_frame � compact_loop � compact_marked � compact_copy_loop � compact_finish  compact_exit 
 mark_it  mark  mark_list 3 list_cmp > list_comparator D list_set K dict_set ^ dict_set_to_index � list_get � list_del � dict_get � dict_get_item_from_index � list_find � dict_del � dict_del_item_from_index � dict_iterator_comparator  list_iterator_comparator  list_iterate " list_iterate_loop 2 list_iterate_done A list_iterate_break E list_repr H list_repr_loop k list_repr_skip_comma z list_repr_finish � dict_repr � dict_repr_loop � dict_repr_skip_comma � dict_repr_finish � int_create  int16_to_int  uint16_to_int ! uint16_to_int_alloc . int_to_int16 : int_parse A int_parse_loop ] int_parse_sign ~ int_to_str � int_to_str_loop � allocate_chars � itoa_reverse_string � int_bitwise_or � int_bitwise � int_bitwise_loop � int_bitwise_break  int_bitwise_xor 
 int_bitwise_and  int_lshift  int_lshift_loop D int_rshift U int_rshift_real p int_rshift_loop }
 int_abs � int_complement � int_negate � int_negate_or_complement � xor_loop �
 int_sgn �
 int_cmp � int_cmp_loop  int_cmp_lt ) int_cmp_gt -
 int_sub 1
 int_add E int_add_loop [ int_add_copy_loop {
 int_pow � int_pow_loop � int_pow_skip � int_pow_break � int_pow_0 � int_pow_1 �
 int_mul � int_mul_words_loop � int_mul_carry_loop � int_mul_carry_break �
 int_div (
 int_mod 9 int_division J division_loop } remainder_shift_loop � quotient_shift_loop � division_cmp_loop � division_subtract_loop � division_finish � division_set_modulo_sign � division_return_tuple � int_normalize � int_normalize_count_loop  int_normalize_count_break  int_normalize_copy_loop 4 int_extend : int_extend_copy_loop N int_extend_fill_loop Y array_get _ array_set c array_del g loop q array_del_finish x array_element | array_return_0 � array_insert � array_insert_prepare � array_insert_copy � array_insert_finish � array_split � array_split_loop � array_merge � array_merge_left_loop  array_merge_right  array_merge_right_loop  array_cmp  array_cmp_loop ( array_cmp_loop_break 6 array_repeat @ array_repeat_loop ^ array_sort f array_sort_outer s array_sort_inner z array_clone � array_clone_loop �
 str_cmp � str_comparator � str_comparator_select � str_cmp_ignore_case � str_comparator_ignore_case � str_search � str_search_outer_loop � str_search_inner_loop � str_search_no_match � edit_main �
 cp_loop  	 loop22 5  edit_main_loop @  edit_main_finish |  cp_loop2 � 	 loop33 �  edit_key_up �  edit_key_down �  edit_key_left �  edit_key_right �  edit_key_del �  edit_key_bs �  edit_key_newline ! edit_key_character ! edit_win_draw ! edit_win_draw_loop ! edit_line_draw ! edit_line_skip_start ! edit_line_chars *! edit_line_chars_loop -! edit_line_chars_loop_1 @! edit_line_skip_end G! edit_gap_move T! edit_gap_move_loop X! edit_insert_char m! edit_remove_char z! bol �! eol �! prevline �! nextline �! pos_x �! win_x �! win_x_loop �! win_normalize �! win_normalize_2 �! win_normalize_1 " win_normalize_4 	" win_normalize_3 " win_normalize_6 " win_normalize_5 "" win_normalize_8 ." win_normalize_7 ;"