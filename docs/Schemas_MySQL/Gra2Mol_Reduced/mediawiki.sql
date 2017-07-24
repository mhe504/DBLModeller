CREATE TABLE archive (
  ar_id NUMBER  NOT NULL ,
  ar_namespace NUMBER NOT NULL ,
  ar_title VARCHAR2(255) NOT NULL ,
  ar_text VARCHAR2(255) NOT NULL,
  ar_comment VARCHAR2(255) NOT NULL,
  ar_user NUMBER  NOT NULL ,
  ar_user_text VARCHAR2(255) NOT NULL,
  ar_timestamp VARCHAR2(255) NOT NULL ,
  ar_minor_edit NUMBER NOT NULL ,
  ar_flags VARCHAR2(255) NOT NULL,
  ar_rev_id NUMBER  ,
  ar_text_id NUMBER  ,
  ar_deleted NUMBER  NOT NULL ,
  ar_len NUMBER  ,
  ar_page_id NUMBER  ,
  ar_parent_id NUMBER  ,
  ar_sha1 VARCHAR2(255) NOT NULL ,
  ar_content_model VARCHAR2(255) ,
  ar_content_format VARCHAR2(255) 
) ;
CREATE TABLE category (
  cat_id NUMBER  NOT NULL ,
  cat_title VARCHAR2(255) NOT NULL ,
  cat_pages NUMBER NOT NULL ,
  cat_subcats NUMBER NOT NULL ,
  cat_files NUMBER NOT NULL 
) ;
CREATE TABLE categorylinks (
  cl_from NUMBER  NOT NULL ,
  cl_to VARCHAR2(255) NOT NULL ,
  cl_sortkey VARCHAR2(255) NOT NULL ,
  cl_timestamp VARCHAR2(255) NOT NULL ,
  cl_sortkey_prefix VARCHAR2(255) NOT NULL ,
  cl_collation VARCHAR2(255) NOT NULL ,
  cl_type VARCHAR2(255)
) ;
CREATE TABLE change_tag (
  ct_rc_id NUMBER ,
  ct_log_id NUMBER ,
  ct_rev_id NUMBER ,
  ct_tag VARCHAR2(255) NOT NULL,
  ct_params VARCHAR2(255));
CREATE TABLE externallinks (
  el_id NUMBER  NOT NULL ,
  el_from NUMBER  NOT NULL ,
  el_to VARCHAR2(255) NOT NULL,
  el_index VARCHAR2(255) NOT NULL
) ;
CREATE TABLE filearchive (
  fa_id NUMBER NOT NULL ,
  fa_name VARCHAR2(255) NOT NULL ,
  fa_archive_name VARCHAR2(255) ,
  fa_storage_group VARCHAR2(255) ,
  fa_storage_key VARCHAR2(255) ,
  fa_deleted_user NUMBER ,
  fa_deleted_timestamp VARCHAR2(255) ,
  fa_deleted_reason VARCHAR2(255),
  fa_size NUMBER  ,
  fa_width NUMBER ,
  fa_height NUMBER ,
  fa_metadata VARCHAR2(255),
  fa_bits NUMBER ,
  fa_media_type VARCHAR2(255),
  fa_major_mime VARCHAR2(255),
  fa_minor_mime VARCHAR2(255) ,
  fa_description VARCHAR2(255),
  fa_user NUMBER  ,
  fa_user_text VARCHAR2(255) ,
  fa_timestamp VARCHAR2(255) ,
  fa_deleted NUMBER  NOT NULL ,
  fa_sha1 VARCHAR2(255) NOT NULL 
) ;
CREATE TABLE hitcounter (
  hc_id NUMBER  NOT NULL
) ;
CREATE TABLE image (
  img_name VARCHAR2(255) NOT NULL ,
  img_size NUMBER  NOT NULL ,
  img_width NUMBER NOT NULL ,
  img_height NUMBER NOT NULL ,
  img_metadata VARCHAR2(255) NOT NULL,
  img_bits NUMBER NOT NULL ,
  img_media_type VARCHAR2(255),
  img_major_mime VARCHAR2(255),
  img_minor_mime VARCHAR2(255) NOT NULL ,
  img_description VARCHAR2(255) NOT NULL,
  img_user NUMBER  NOT NULL ,
  img_user_text VARCHAR2(255) NOT NULL ,
  img_timestamp VARCHAR2(255) NOT NULL ,
  img_sha1 VARCHAR2(255) NOT NULL 
) ;
CREATE TABLE imagelinks (
  il_from NUMBER  NOT NULL ,
  il_to VARCHAR2(255) NOT NULL ,
  il_from_namespace NUMBER NOT NULL 
) ;
CREATE TABLE interwiki (
  iw_prefix VARCHAR2(255) NOT NULL,
  iw_url VARCHAR2(255) NOT NULL,
  iw_local NUMBER NOT NULL ,
  iw_trans NUMBER NOT NULL ,
  iw_api VARCHAR2(255) NOT NULL,
  iw_wikiid VARCHAR2(255) NOT NULL
) ;
CREATE TABLE ipblocks (
  ipb_id NUMBER NOT NULL ,
  ipb_address VARCHAR2(255) NOT NULL,
  ipb_user NUMBER  NOT NULL ,
  ipb_by NUMBER  NOT NULL ,
  ipb_by_text VARCHAR2(255) NOT NULL ,
  ipb_reason VARCHAR2(255) NOT NULL,
  ipb_timestamp VARCHAR2(255) NOT NULL ,
  ipb_auto NUMBER NOT NULL ,
  ipb_anon_only NUMBER NOT NULL ,
  ipb_create_account NUMBER NOT NULL ,
  ipb_enable_autoblock NUMBER NOT NULL ,
  ipb_expiry VARCHAR2(255) NOT NULL ,
  ipb_range_start VARCHAR2(255) NOT NULL,
  ipb_range_end VARCHAR2(255) NOT NULL,
  ipb_deleted NUMBER NOT NULL ,
  ipb_block_email NUMBER NOT NULL ,
  ipb_allow_usertalk NUMBER NOT NULL ,
  ipb_parent_block_id NUMBER 
) ;
CREATE TABLE iwlinks (
  iwl_from NUMBER  NOT NULL ,
  iwl_prefix VARCHAR2(255) NOT NULL ,
  iwl_title VARCHAR2(255) NOT NULL 
) ;
CREATE TABLE job (
  job_id NUMBER  NOT NULL ,
  job_cmd VARCHAR2(255) NOT NULL ,
  job_namespace NUMBER NOT NULL,
  job_title VARCHAR2(255) NOT NULL,
  job_timestamp VARCHAR2(255) ,
  job_params VARCHAR2(255) NOT NULL,
  job_random NUMBER  NOT NULL ,
  job_attempts NUMBER  NOT NULL ,
  job_token VARCHAR2(255) NOT NULL ,
  job_token_timestamp VARCHAR2(255) ,
  job_sha1 VARCHAR2(255) NOT NULL 
) ;
CREATE TABLE l10n_cache (
  lc_lang VARCHAR2(255) NOT NULL,
  lc_key VARCHAR2(255) NOT NULL,
  lc_value VARCHAR2(255) NOT NULL
) ;
CREATE TABLE langlinks (
  ll_from NUMBER  NOT NULL ,
  ll_lang VARCHAR2(255) NOT NULL ,
  ll_title VARCHAR2(255) NOT NULL 
) ;
CREATE TABLE log_search (
  ls_field VARCHAR2(255) NOT NULL,
  ls_value VARCHAR2(255) NOT NULL,
  ls_log_id NUMBER  NOT NULL 
) ;
CREATE TABLE logging (
  log_id NUMBER  NOT NULL ,
  log_type VARCHAR2(255) NOT NULL ,
  log_action VARCHAR2(255) NOT NULL ,
  log_timestamp VARCHAR2(255) NOT NULL ,
  log_user NUMBER  NOT NULL ,
  log_user_text VARCHAR2(255) NOT NULL ,
  log_namespace NUMBER NOT NULL ,
  log_title VARCHAR2(255) NOT NULL ,
  log_page NUMBER  ,
  log_comment VARCHAR2(255) NOT NULL ,
  log_params VARCHAR2(255) NOT NULL,
  log_deleted NUMBER  NOT NULL 
) ;
CREATE TABLE module_deps (
  md_module VARCHAR2(255) NOT NULL,
  md_skin VARCHAR2(255) NOT NULL,
  md_deps VARCHAR2(255) NOT NULL
) ;
CREATE TABLE msg_resource (
  mr_resource VARCHAR2(255) NOT NULL,
  mr_lang VARCHAR2(255) NOT NULL,
  mr_unknown VARCHAR2(255) NOT NULL,
  mr_timestamp VARCHAR2(255) NOT NULL
) ;
CREATE TABLE msg_resource_links (
  mrl_resource VARCHAR2(255) NOT NULL,
  mrl_message VARCHAR2(255) NOT NULL
) ;
CREATE TABLE objectcache (
  value VARCHAR2(255),
  exptime VARCHAR2(255) 
) ;
CREATE TABLE oldimage (
  oi_name VARCHAR2(255) NOT NULL ,
  oi_archive_name VARCHAR2(255) NOT NULL ,
  oi_size NUMBER  NOT NULL ,
  oi_width NUMBER NOT NULL ,
  oi_height NUMBER NOT NULL ,
  oi_bits NUMBER NOT NULL ,
  oi_description VARCHAR2(255) NOT NULL,
  oi_user NUMBER  NOT NULL ,
  oi_user_text VARCHAR2(255) NOT NULL,
  oi_timestamp VARCHAR2(255) NOT NULL ,
  oi_metadata VARCHAR2(255) NOT NULL,
  oi_media_type VARCHAR2(255),
  oi_major_mime VARCHAR2(255),
  oi_minor_mime VARCHAR2(255) NOT NULL ,
  oi_deleted NUMBER  NOT NULL ,
  oi_sha1 VARCHAR2(255) NOT NULL 
) ;
CREATE TABLE page (
  page_id NUMBER  NOT NULL ,
  page_namespace NUMBER NOT NULL ,
  page_title VARCHAR2(255) NOT NULL ,
  page_restrictions VARCHAR2(255) NOT NULL,
  page_counter  NUMBER   NOT NULL ,
  page_is_redirect NUMBER  NOT NULL ,
  page_is_new NUMBER  NOT NULL ,
  page_random NUMBER  NOT NULL ,
  page_touched VARCHAR2(255) NOT NULL ,
  page_links_updated VARCHAR2(255) ,
  page_latest NUMBER  NOT NULL ,
  page_len NUMBER  NOT NULL ,
  page_no_title_convert NUMBER NOT NULL ,
  page_content_model VARCHAR2(255) 
) ;
CREATE TABLE page_props (
  pp_page NUMBER NOT NULL ,
  pp_propname VARCHAR2(255) NOT NULL ,
  pp_value VARCHAR2(255) NOT NULL,
  pp_sortkey NUMBER
  ) ;
CREATE TABLE page_restrictions (
  pr_page NUMBER NOT NULL ,
  pr_type VARCHAR2(255) NOT NULL ,
  pr_level VARCHAR2(255) NOT NULL ,
  pr_cascade NUMBER NOT NULL ,
  pr_user NUMBER ,
  pr_expiry VARCHAR2(255) ,
  pr_id NUMBER  NOT NULL 
) ;
CREATE TABLE pagelinks (
  pl_from NUMBER  NOT NULL ,
  pl_namespace NUMBER NOT NULL ,
  pl_title VARCHAR2(255) NOT NULL ,
  pl_from_namespace NUMBER NOT NULL 
) ;
CREATE TABLE protected_titles (
  pt_namespace NUMBER NOT NULL ,
  pt_title VARCHAR2(255) NOT NULL ,
  pt_user NUMBER  NOT NULL ,
  pt_reason VARCHAR2(255) ,
  pt_timestamp VARCHAR2(255) NOT NULL ,
  pt_expiry VARCHAR2(255) NOT NULL ,
  pt_create_perm VARCHAR2(255) NOT NULL 
) ;
CREATE TABLE querycache (
  qc_type VARCHAR2(255) NOT NULL,
  qc_value NUMBER  NOT NULL ,
  qc_namespace NUMBER NOT NULL ,
  qc_title VARCHAR2(255) NOT NULL 
) ;
CREATE TABLE querycache_info (
  qci_type VARCHAR2(255) NOT NULL ,
  qci_timestamp VARCHAR2(255) NOT NULL 
) ;
CREATE TABLE querycachetwo (
  qcc_type VARCHAR2(255) NOT NULL,
  qcc_value NUMBER  NOT NULL ,
  qcc_namespace NUMBER NOT NULL ,
  qcc_title VARCHAR2(255) NOT NULL ,
  qcc_namespacetwo NUMBER NOT NULL ,
  qcc_titletwo VARCHAR2(255) NOT NULL 
) ;
CREATE TABLE recentchanges (
  rc_id NUMBER NOT NULL ,
  rc_timestamp VARCHAR2(255) NOT NULL ,
  rc_cur_time VARCHAR2(255) NOT NULL ,
  rc_user NUMBER  NOT NULL ,
  rc_user_text VARCHAR2(255) NOT NULL,
  rc_namespace NUMBER NOT NULL ,
  rc_title VARCHAR2(255) NOT NULL ,
  rc_comment VARCHAR2(255) NOT NULL ,
  rc_minor NUMBER  NOT NULL ,
  rc_bot NUMBER  NOT NULL ,
  rc_new NUMBER  NOT NULL ,
  rc_cur_id NUMBER  NOT NULL ,
  rc_this_oldid NUMBER  NOT NULL ,
  rc_last_oldid NUMBER  NOT NULL ,
  rc_type NUMBER  NOT NULL ,
  rc_source VARCHAR2(255) NOT NULL ,
  rc_patrolled NUMBER  NOT NULL ,
  rc_ip VARCHAR2(255) NOT NULL ,
  rc_old_len NUMBER ,
  rc_new_len NUMBER ,
  rc_deleted NUMBER  NOT NULL ,
  rc_logid NUMBER  NOT NULL ,
  rc_log_type VARCHAR2(255) ,
  rc_log_action VARCHAR2(255) ,
  rc_params VARCHAR2(255)
) ;
CREATE TABLE redirect (
  rd_from NUMBER  NOT NULL ,
  rd_namespace NUMBER NOT NULL ,
  rd_title VARCHAR2(255) NOT NULL ,
  rd_interwiki VARCHAR2(255) ,
  rd_fragment VARCHAR2(255) 
) ;
CREATE TABLE revision (
  rev_id NUMBER  NOT NULL ,
  rev_page NUMBER  NOT NULL,
  rev_text_id NUMBER  NOT NULL,
  rev_comment VARCHAR2(255) NOT NULL,
  rev_user NUMBER  NOT NULL ,
  rev_user_text VARCHAR2(255) NOT NULL ,
  rev_timestamp VARCHAR2(255) NOT NULL ,
  rev_minor_edit NUMBER  NOT NULL ,
  rev_deleted NUMBER  NOT NULL ,
  rev_len NUMBER  ,
  rev_parent_id NUMBER  ,
  rev_sha1 VARCHAR2(255) NOT NULL ,
  rev_content_model VARCHAR2(255) ,
  rev_content_format VARCHAR2(255) 
) ;
CREATE TABLE searchindex (
  si_page NUMBER  NOT NULL,
  si_title VARCHAR2(255) NOT NULL ,
  si_text VARCHAR2(255) NOT NULL
) ;
CREATE TABLE site_identifiers (
  si_site NUMBER  NOT NULL,
  si_type VARCHAR2(255) NOT NULL,
  si_key VARCHAR2(255) NOT NULL
) ;
CREATE TABLE site_stats (
  ss_row_id NUMBER  NOT NULL ,
  ss_total_views  NUMBER   ,
  ss_total_edits  NUMBER   ,
  ss_good_articles  NUMBER   ,
  ss_total_pages  NUMBER  ,
  ss_users  NUMBER  ,
  ss_images NUMBER ,
  ss_active_users  NUMBER  
) ;
CREATE TABLE sites (
  site_id NUMBER  NOT NULL ,
  site_global_key VARCHAR2(255) NOT NULL,
  site_type VARCHAR2(255) NOT NULL,
  site_group VARCHAR2(255) NOT NULL,
  site_source VARCHAR2(255) NOT NULL,
  site_language VARCHAR2(255) NOT NULL,
  site_protocol VARCHAR2(255) NOT NULL,
  site_domain VARCHAR2(255) NOT NULL,
  site_data VARCHAR2(255) NOT NULL,
  site_forward NUMBER NOT NULL,
  site_config VARCHAR2(255) NOT NULL
) ;
CREATE TABLE tag_summary (
  ts_rc_id NUMBER ,
  ts_log_id NUMBER ,
  ts_rev_id NUMBER ,
  ts_tags VARCHAR2(255) NOT NULL);
CREATE TABLE templatelinks (
  tl_from NUMBER  NOT NULL ,
  tl_namespace NUMBER NOT NULL ,
  tl_title VARCHAR2(255) NOT NULL ,
  tl_from_namespace NUMBER NOT NULL 
) ;
CREATE TABLE text (
  old_id NUMBER  NOT NULL ,
  old_text VARCHAR2(255) NOT NULL,
  old_flags VARCHAR2(255) NOT NULL
) ;
CREATE TABLE transcache (
  tc_url VARCHAR2(255) NOT NULL,
  tc_contents VARCHAR2(255),
  tc_time VARCHAR2(255) NOT NULL
) ;
CREATE TABLE updatelog (
  ul_key VARCHAR2(255) NOT NULL,
  ul_value VARCHAR2(255)
) ;
CREATE TABLE uploadstash (
  us_id NUMBER  NOT NULL ,
  us_user NUMBER  NOT NULL,
  us_key VARCHAR2(255) NOT NULL,
  us_orig_path VARCHAR2(255) NOT NULL,
  us_path VARCHAR2(255) NOT NULL,
  us_source_type VARCHAR2(255) ,
  us_timestamp VARCHAR2(255) NOT NULL,
  us_status VARCHAR2(255) NOT NULL,
  us_chunk_inx NUMBER  ,
  us_props VARCHAR2(255),
  us_size NUMBER  NOT NULL,
  us_sha1 VARCHAR2(255) NOT NULL,
  us_mime VARCHAR2(255) ,
  us_media_type VARCHAR2(255),
  us_image_width NUMBER  ,
  us_image_height NUMBER  ,
  us_image_bits NUMBER  
) ;
CREATE TABLE user (
  user_id NUMBER  NOT NULL ,
  user_name VARCHAR2(255) NOT NULL ,
  user_real_name VARCHAR2(255) NOT NULL ,
  user_password VARCHAR2(255) NOT NULL,
  user_newpassword VARCHAR2(255) NOT NULL,
  user_newpass_time VARCHAR2(255) ,
  user_email VARCHAR2(255) NOT NULL,
  user_touched VARCHAR2(255) NOT NULL ,
  user_token VARCHAR2(255) NOT NULL ,
  user_email_authenticated VARCHAR2(255) ,
  user_email_token VARCHAR2(255) ,
  user_email_token_expires VARCHAR2(255) ,
  user_registration VARCHAR2(255) ,
  user_editcount NUMBER ,
  user_password_expires VARCHAR2(255) 
) ;
CREATE TABLE user_former_groups (
  ufg_user NUMBER  NOT NULL ,
  ufg_group VARCHAR2(255) NOT NULL 
) ;
CREATE TABLE user_groups (
  ug_user NUMBER  NOT NULL ,
  ug_group VARCHAR2(255) NOT NULL 
) ;
CREATE TABLE user_newtalk (
  user_id NUMBER NOT NULL ,
  user_ip VARCHAR2(255) NOT NULL ,
  user_last_timestamp VARCHAR2(255) 
) ;
CREATE TABLE user_properties (
  up_user NUMBER NOT NULL,
  up_property VARCHAR2(255) NOT NULL,
  up_value VARCHAR2(255)
) ;
CREATE TABLE valid_tag (
  vt_tag VARCHAR2(255) NOT NULL
) ;
CREATE TABLE watchlist (
  wl_user NUMBER  NOT NULL,
  wl_namespace NUMBER NOT NULL ,
  wl_title VARCHAR2(255) NOT NULL ,
  wl_notificationtimestamp VARCHAR2(255) 
) ;

