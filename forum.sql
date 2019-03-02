drop table if exists user;
CREATE TABLE user(
    pk_user_id bigint NOT NULL AUTO_INCREMENT  COMMENT '用户id' ,
    account VARCHAR(32) NOT NULL   COMMENT '账号' ,
    name VARCHAR(32) NOT NULL   COMMENT '姓名' ,
    password VARCHAR(32) NOT NULL   COMMENT '登陆密码' ,
    sex VARCHAR(32) NOT NULL   COMMENT '性别 0：男，1：女' ,
    salt VARCHAR(32) NOT NULL  DEFAULT 'user' COMMENT '盐值' ,
    header_image VARCHAR(128)    COMMENT '头像' ,
    nick_name VARCHAR(32) NOT NULL   COMMENT '昵称' ,
    qq VARCHAR(32) NOT NULL  DEFAULT '' COMMENT 'qq账号' ,
    phone VARCHAR(32) NOT NULL   COMMENT '手机号' ,
    birthday DATE    COMMENT '出生日期' ,
    total_total INT NOT NULL  DEFAULT 0 COMMENT '帖子数' ,
    dynamic_total INT NOT NULL  DEFAULT 0 COMMENT '动态数' ,
    is_tourist tinyint(1) NOT NULL  DEFAULT 1 COMMENT '游客 0：是，1：不是' ,
    is_Del tinyint(1) NOT NULL  DEFAULT 0 COMMENT '假删除 0：未删除，1：已删除' ,
    create_time DATETIME NOT NULL  DEFAULT now() COMMENT '创建时间' ,
    update_time DATETIME NOT NULL  DEFAULT now() COMMENT '更新时间' ,
    PRIMARY KEY (pk_user_id)
) COMMENT = '用户表 ';
drop table if exists posts;
CREATE TABLE posts(
  pk_posts_id bigint NOT NULL AUTO_INCREMENT  COMMENT '主键' ,
  fk_user_id bigint NOT NULL   COMMENT '创建人' ,
  fk_administrator_id bigint    COMMENT '创建人' ,
  posts_title VARCHAR(128) NOT NULL   COMMENT '帖子标题' ,
  posts_content TEXT NOT NULL   COMMENT '帖子内容' ,
  is_Del tinyint(1) NOT NULL   COMMENT '假删除 0：未删除，1：已删除' ,
  create_time DATETIME   DEFAULT now() COMMENT '创建时间' ,
  update_time DATETIME   DEFAULT now() COMMENT '更新时间' ,
  PRIMARY KEY (pk_posts_id)
) COMMENT = '帖子表 ';
drop table if exists dynamic;
CREATE TABLE dynamic(
  pk_dynamic_id bigint NOT NULL AUTO_INCREMENT  COMMENT '主键' ,
  fk_user_id bigint NOT NULL   COMMENT '创建人' ,
  dynamic_title VARCHAR(128) NOT NULL   COMMENT '标题' ,
  fk_administrator_id bigint    COMMENT '创建人' ,
  dynamic_content TEXT NOT NULL   COMMENT '内容' ,
  is_Del tinyint(1) NOT NULL   COMMENT '假删除 0：未删除，1：已删除' ,
  create_time DATETIME   DEFAULT now() COMMENT '创建时间' ,
  update_time DATETIME   DEFAULT now() COMMENT '更新时间' ,
  PRIMARY KEY (pk_dynamic_id)
) COMMENT = '动态表 ';
drop table if exists dictionary;
CREATE TABLE dictionary(
  pk_dictionary_id bigint NOT NULL AUTO_INCREMENT  COMMENT '字典id' ,
  table_name VARCHAR(32) NOT NULL  DEFAULT '' COMMENT '数据库表名' ,
  field_name VARCHAR(32) NOT NULL  DEFAULT '' COMMENT '数据库字段' ,
  dictionary_value INT NOT NULL  DEFAULT 0 COMMENT '数据库枚举值' ,
  dictionary_text VARCHAR(32) NOT NULL  DEFAULT '' COMMENT '数据库枚举显示文本' ,
  create_time DATETIME NOT NULL  DEFAULT now() COMMENT '创建时间' ,
  update_time DATETIME NOT NULL  DEFAULT now() COMMENT '更新时间' ,
  is_del tinyint(1) NOT NULL  DEFAULT 0 COMMENT '假删除 0：未删除，1：已删除' ,
  PRIMARY KEY (pk_dictionary_id)
) COMMENT = '字典表 ';
drop table if exists message;
CREATE TABLE message(
  pk_message_id bigint NOT NULL AUTO_INCREMENT  COMMENT '主键' ,
  fk_administrator_id bigint NOT NULL   COMMENT '发送者id' ,
  fk_user_id bigint NOT NULL   COMMENT '接收者id' ,
  content VARCHAR(512) NOT NULL  DEFAULT '' COMMENT '内容' ,
  is_delivery tinyint(1) NOT NULL  DEFAULT 0 COMMENT '是否发送 0：未发送，1：已发送' ,
  is_read tinyint(1) NOT NULL  DEFAULT 0 COMMENT '是否已读 0：未读，1：已读' ,
  del_status tinyint(1) NOT NULL  DEFAULT 0 COMMENT '删除状态 0，未删除，1：管理员删除，2：业务员删除' ,
  create_time DATETIME NOT NULL  DEFAULT now() COMMENT '创建时间' ,
  update_time DATETIME NOT NULL  DEFAULT now() COMMENT '更新时间' ,
  is_del tinyint(1) NOT NULL  DEFAULT 0 COMMENT '假删除 0：未删除，1：已删除' ,
  PRIMARY KEY (pk_message_id)
) COMMENT = '消息表 ';
drop table if exists msn_template;
CREATE TABLE msn_template(
  pk_msn_template_id bigint NOT NULL AUTO_INCREMENT  COMMENT '短信模板id' ,
  title VARCHAR(32) NOT NULL  DEFAULT '' COMMENT '短信标题' ,
  content VARCHAR(512) NOT NULL  DEFAULT '' COMMENT '短信内容' ,
  is_global tinyint(1) NOT NULL  DEFAULT 0 COMMENT '是否全局模板 0：否，1：是' ,
  creator bigint NOT NULL   COMMENT '创建人' ,
  create_time DATETIME NOT NULL  DEFAULT now() COMMENT '创建时间' ,
  update_time DATETIME NOT NULL  DEFAULT now() COMMENT '更新时间' ,
  is_del tinyint(1) NOT NULL  DEFAULT 0 COMMENT '假删除 0：未删除，1：已删除' ,
  PRIMARY KEY (pk_msn_template_id)
) COMMENT = '短信模板 ';

drop table if exists msn_record;
CREATE TABLE msn_record(
  pk_msn_record_id bigint NOT NULL AUTO_INCREMENT  COMMENT '短信记录id' ,
  title VARCHAR(32) NOT NULL  DEFAULT '' COMMENT '标题' ,
  content VARCHAR(512) NOT NULL  DEFAULT '' COMMENT '内容' ,
  note VARCHAR(512) NOT NULL  DEFAULT '' COMMENT '备注' ,
  sender bigint NOT NULL   COMMENT '发送人' ,
  sender_type bigint NOT NULL   COMMENT '发送人类型 0：系统，1：管理员，2：员工' ,
  receiver bigint NOT NULL   COMMENT '接收人' ,
  receiver_type INT NOT NULL   COMMENT '接收人类型 0：合伙人，1：客户，2：客户组' ,
  create_time DATETIME NOT NULL  DEFAULT now() COMMENT '创建时间' ,
  update_time DATETIME NOT NULL  DEFAULT now() COMMENT '更新时间' ,
  is_del tinyint(1) NOT NULL  DEFAULT 0 COMMENT '假删除 0：未删除，1：已删除' ,
  PRIMARY KEY (pk_msn_record_id)
) COMMENT = '短信记录 ';

drop table if exists help;
CREATE TABLE help(
  pk_help_id bigint NOT NULL AUTO_INCREMENT  COMMENT '主键' ,
  title VARCHAR(128) NOT NULL  DEFAULT '' COMMENT '标题' ,
  content VARCHAR(512) NOT NULL  DEFAULT '' COMMENT '内容' ,
  fk_administrator_id bigint NOT NULL   COMMENT '作者' ,
  create_time DATETIME NOT NULL  DEFAULT now() COMMENT '创建时间' ,
  update_time DATETIME NOT NULL  DEFAULT now() COMMENT '更新时间' ,
  is_del tinyint(1) NOT NULL  DEFAULT 0 COMMENT '假删除 0：未删除，1：已删除' ,
  PRIMARY KEY (pk_help_id)
) COMMENT = '系统帮助表 ';
drop table if exists upgrade_level;
CREATE TABLE upgrade_level(
  pk_upgrade_level_id bigint NOT NULL AUTO_INCREMENT  COMMENT '等级升级申请单id' ,
  fk_user_id bigint NOT NULL   COMMENT '用户' ,
  level INT NOT NULL   COMMENT '等级' ,
  create_time DATETIME NOT NULL  DEFAULT now() COMMENT '创建时间' ,
  update_time DATETIME NOT NULL  DEFAULT now() COMMENT '更新时间' ,
  is_del tinyint(1) NOT NULL  DEFAULT 0 COMMENT '假删除 0：未删除，1：已删除' ,
  PRIMARY KEY (pk_upgrade_level_id)
) COMMENT = '等级升级申请单 ';
drop table if exists user_revise_apply;
CREATE TABLE user_revise_apply(
  REVISION INT    COMMENT '乐观锁' ,
  CREATED_BY VARCHAR(32)    COMMENT '创建人' ,
  CREATED_TIME DATETIME   DEFAULT now() COMMENT '创建时间' ,
  UPDATED_TIME DATETIME   DEFAULT now() COMMENT '更新时间'
) COMMENT = '用户申请表 ';
drop table if exists comment;
CREATE TABLE comment(
    pk_comment_id bigint NOT NULL AUTO_INCREMENT  COMMENT '主键' ,
    fk_user_id bigint NOT NULL   COMMENT '父评论人' ,
    top_user_id bigint    COMMENT '子回复人' ,
    fk_posts_id bigint NOT NULL   COMMENT '帖子id' ,
    content VARCHAR(1024) NOT NULL   COMMENT '评论内容' ,
    create_time DATETIME NOT NULL  DEFAULT now() COMMENT '创建时间' ,
    update_time DATETIME NOT NULL  DEFAULT now() COMMENT '更新时间' ,
    is_del tinyint(1) NOT NULL  DEFAULT 0 COMMENT '假删除 0：未删除，1：已删除' ,
    PRIMARY KEY (pk_comment_id)
) COMMENT = '评论表 ';


