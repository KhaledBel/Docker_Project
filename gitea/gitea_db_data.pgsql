--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.12
-- Dumped by pg_dump version 9.6.12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: access; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.access (
    id bigint NOT NULL,
    user_id bigint,
    repo_id bigint,
    mode integer
);


ALTER TABLE public.access OWNER TO gitea;

--
-- Name: access_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.access_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.access_id_seq OWNER TO gitea;

--
-- Name: access_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.access_id_seq OWNED BY public.access.id;


--
-- Name: access_token; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.access_token (
    id bigint NOT NULL,
    uid bigint,
    name character varying(255),
    sha1 character varying(40),
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.access_token OWNER TO gitea;

--
-- Name: access_token_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.access_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.access_token_id_seq OWNER TO gitea;

--
-- Name: access_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.access_token_id_seq OWNED BY public.access_token.id;


--
-- Name: action; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.action (
    id bigint NOT NULL,
    user_id bigint,
    op_type integer,
    act_user_id bigint,
    repo_id bigint,
    comment_id bigint,
    is_deleted boolean DEFAULT false NOT NULL,
    ref_name character varying(255),
    is_private boolean DEFAULT false NOT NULL,
    content text,
    created_unix bigint
);


ALTER TABLE public.action OWNER TO gitea;

--
-- Name: action_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.action_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.action_id_seq OWNER TO gitea;

--
-- Name: action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.action_id_seq OWNED BY public.action.id;


--
-- Name: attachment; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.attachment (
    id bigint NOT NULL,
    uuid uuid,
    issue_id bigint,
    release_id bigint,
    comment_id bigint,
    name character varying(255),
    download_count bigint DEFAULT 0,
    size bigint DEFAULT 0,
    created_unix bigint
);


ALTER TABLE public.attachment OWNER TO gitea;

--
-- Name: attachment_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.attachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attachment_id_seq OWNER TO gitea;

--
-- Name: attachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.attachment_id_seq OWNED BY public.attachment.id;


--
-- Name: collaboration; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.collaboration (
    id bigint NOT NULL,
    repo_id bigint NOT NULL,
    user_id bigint NOT NULL,
    mode integer DEFAULT 2 NOT NULL
);


ALTER TABLE public.collaboration OWNER TO gitea;

--
-- Name: collaboration_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.collaboration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collaboration_id_seq OWNER TO gitea;

--
-- Name: collaboration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.collaboration_id_seq OWNED BY public.collaboration.id;


--
-- Name: comment; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.comment (
    id bigint NOT NULL,
    type integer,
    poster_id bigint,
    issue_id bigint,
    label_id bigint,
    old_milestone_id bigint,
    milestone_id bigint,
    assignee_id bigint,
    removed_assignee boolean,
    old_title character varying(255),
    new_title character varying(255),
    dependent_issue_id bigint,
    commit_id bigint,
    line bigint,
    tree_path character varying(255),
    content text,
    patch text,
    created_unix bigint,
    updated_unix bigint,
    commit_sha character varying(40),
    review_id bigint,
    invalidated boolean
);


ALTER TABLE public.comment OWNER TO gitea;

--
-- Name: comment_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_id_seq OWNER TO gitea;

--
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.comment_id_seq OWNED BY public.comment.id;


--
-- Name: commit_status; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.commit_status (
    id bigint NOT NULL,
    index bigint,
    repo_id bigint,
    state character varying(7) NOT NULL,
    sha character varying(64) NOT NULL,
    target_url text,
    description text,
    context text,
    creator_id bigint,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.commit_status OWNER TO gitea;

--
-- Name: commit_status_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.commit_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commit_status_id_seq OWNER TO gitea;

--
-- Name: commit_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.commit_status_id_seq OWNED BY public.commit_status.id;


--
-- Name: deleted_branch; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.deleted_branch (
    id bigint NOT NULL,
    repo_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    commit character varying(255) NOT NULL,
    deleted_by_id bigint,
    deleted_unix bigint
);


ALTER TABLE public.deleted_branch OWNER TO gitea;

--
-- Name: deleted_branch_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.deleted_branch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deleted_branch_id_seq OWNER TO gitea;

--
-- Name: deleted_branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.deleted_branch_id_seq OWNED BY public.deleted_branch.id;


--
-- Name: deploy_key; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.deploy_key (
    id bigint NOT NULL,
    key_id bigint,
    repo_id bigint,
    name character varying(255),
    fingerprint character varying(255),
    mode integer DEFAULT 1 NOT NULL,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.deploy_key OWNER TO gitea;

--
-- Name: deploy_key_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.deploy_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deploy_key_id_seq OWNER TO gitea;

--
-- Name: deploy_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.deploy_key_id_seq OWNED BY public.deploy_key.id;


--
-- Name: email_address; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.email_address (
    id bigint NOT NULL,
    uid bigint NOT NULL,
    email character varying(255) NOT NULL,
    is_activated boolean
);


ALTER TABLE public.email_address OWNER TO gitea;

--
-- Name: email_address_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.email_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_address_id_seq OWNER TO gitea;

--
-- Name: email_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.email_address_id_seq OWNED BY public.email_address.id;


--
-- Name: external_login_user; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.external_login_user (
    external_id character varying(255) NOT NULL,
    user_id bigint NOT NULL,
    login_source_id bigint NOT NULL
);


ALTER TABLE public.external_login_user OWNER TO gitea;

--
-- Name: follow; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.follow (
    id bigint NOT NULL,
    user_id bigint,
    follow_id bigint
);


ALTER TABLE public.follow OWNER TO gitea;

--
-- Name: follow_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.follow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.follow_id_seq OWNER TO gitea;

--
-- Name: follow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.follow_id_seq OWNED BY public.follow.id;


--
-- Name: gpg_key; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.gpg_key (
    id bigint NOT NULL,
    owner_id bigint NOT NULL,
    key_id character(16) NOT NULL,
    primary_key_id character(16),
    content text NOT NULL,
    created_unix bigint,
    expired_unix bigint,
    added_unix bigint,
    emails text,
    can_sign boolean,
    can_encrypt_comms boolean,
    can_encrypt_storage boolean,
    can_certify boolean
);


ALTER TABLE public.gpg_key OWNER TO gitea;

--
-- Name: gpg_key_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.gpg_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gpg_key_id_seq OWNER TO gitea;

--
-- Name: gpg_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.gpg_key_id_seq OWNED BY public.gpg_key.id;


--
-- Name: hook_task; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.hook_task (
    id bigint NOT NULL,
    repo_id bigint,
    hook_id bigint,
    uuid character varying(255),
    type integer,
    url text,
    payload_content text,
    content_type integer,
    event_type character varying(255),
    is_ssl boolean,
    is_delivered boolean,
    delivered bigint,
    is_succeed boolean,
    request_content text,
    response_content text
);


ALTER TABLE public.hook_task OWNER TO gitea;

--
-- Name: hook_task_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.hook_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hook_task_id_seq OWNER TO gitea;

--
-- Name: hook_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.hook_task_id_seq OWNED BY public.hook_task.id;


--
-- Name: issue; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.issue (
    id bigint NOT NULL,
    repo_id bigint,
    index bigint,
    poster_id bigint,
    name character varying(255),
    content text,
    milestone_id bigint,
    priority integer,
    is_closed boolean,
    is_pull boolean,
    num_comments integer,
    ref character varying(255),
    deadline_unix bigint,
    created_unix bigint,
    updated_unix bigint,
    closed_unix bigint,
    is_locked boolean DEFAULT false NOT NULL
);


ALTER TABLE public.issue OWNER TO gitea;

--
-- Name: issue_assignees; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.issue_assignees (
    id bigint NOT NULL,
    assignee_id bigint,
    issue_id bigint
);


ALTER TABLE public.issue_assignees OWNER TO gitea;

--
-- Name: issue_assignees_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.issue_assignees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_assignees_id_seq OWNER TO gitea;

--
-- Name: issue_assignees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.issue_assignees_id_seq OWNED BY public.issue_assignees.id;


--
-- Name: issue_dependency; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.issue_dependency (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    issue_id bigint NOT NULL,
    dependency_id bigint NOT NULL,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.issue_dependency OWNER TO gitea;

--
-- Name: issue_dependency_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.issue_dependency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_dependency_id_seq OWNER TO gitea;

--
-- Name: issue_dependency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.issue_dependency_id_seq OWNED BY public.issue_dependency.id;


--
-- Name: issue_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.issue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_id_seq OWNER TO gitea;

--
-- Name: issue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.issue_id_seq OWNED BY public.issue.id;


--
-- Name: issue_label; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.issue_label (
    id bigint NOT NULL,
    issue_id bigint,
    label_id bigint
);


ALTER TABLE public.issue_label OWNER TO gitea;

--
-- Name: issue_label_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.issue_label_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_label_id_seq OWNER TO gitea;

--
-- Name: issue_label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.issue_label_id_seq OWNED BY public.issue_label.id;


--
-- Name: issue_user; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.issue_user (
    id bigint NOT NULL,
    uid bigint,
    issue_id bigint,
    is_read boolean,
    is_mentioned boolean
);


ALTER TABLE public.issue_user OWNER TO gitea;

--
-- Name: issue_user_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.issue_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_user_id_seq OWNER TO gitea;

--
-- Name: issue_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.issue_user_id_seq OWNED BY public.issue_user.id;


--
-- Name: issue_watch; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.issue_watch (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    issue_id bigint NOT NULL,
    is_watching boolean NOT NULL,
    created_unix bigint NOT NULL,
    updated_unix bigint NOT NULL
);


ALTER TABLE public.issue_watch OWNER TO gitea;

--
-- Name: issue_watch_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.issue_watch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_watch_id_seq OWNER TO gitea;

--
-- Name: issue_watch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.issue_watch_id_seq OWNED BY public.issue_watch.id;


--
-- Name: label; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.label (
    id bigint NOT NULL,
    repo_id bigint,
    name character varying(255),
    description character varying(255),
    color character varying(7),
    num_issues integer,
    num_closed_issues integer,
    query_string character varying(255),
    is_selected boolean
);


ALTER TABLE public.label OWNER TO gitea;

--
-- Name: label_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.label_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.label_id_seq OWNER TO gitea;

--
-- Name: label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.label_id_seq OWNED BY public.label.id;


--
-- Name: lfs_lock; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.lfs_lock (
    id bigint NOT NULL,
    repo_id bigint NOT NULL,
    owner_id bigint NOT NULL,
    path text,
    created timestamp without time zone
);


ALTER TABLE public.lfs_lock OWNER TO gitea;

--
-- Name: lfs_lock_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.lfs_lock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lfs_lock_id_seq OWNER TO gitea;

--
-- Name: lfs_lock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.lfs_lock_id_seq OWNED BY public.lfs_lock.id;


--
-- Name: lfs_meta_object; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.lfs_meta_object (
    id bigint NOT NULL,
    oid character varying(255) NOT NULL,
    size bigint NOT NULL,
    repository_id bigint NOT NULL,
    created_unix bigint
);


ALTER TABLE public.lfs_meta_object OWNER TO gitea;

--
-- Name: lfs_meta_object_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.lfs_meta_object_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lfs_meta_object_id_seq OWNER TO gitea;

--
-- Name: lfs_meta_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.lfs_meta_object_id_seq OWNED BY public.lfs_meta_object.id;


--
-- Name: login_source; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.login_source (
    id bigint NOT NULL,
    type integer,
    name character varying(255),
    is_actived boolean DEFAULT false NOT NULL,
    is_sync_enabled boolean DEFAULT false NOT NULL,
    cfg text,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.login_source OWNER TO gitea;

--
-- Name: login_source_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.login_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.login_source_id_seq OWNER TO gitea;

--
-- Name: login_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.login_source_id_seq OWNED BY public.login_source.id;


--
-- Name: milestone; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.milestone (
    id bigint NOT NULL,
    repo_id bigint,
    name character varying(255),
    content text,
    is_closed boolean,
    num_issues integer,
    num_closed_issues integer,
    completeness integer,
    deadline_unix bigint,
    closed_date_unix bigint
);


ALTER TABLE public.milestone OWNER TO gitea;

--
-- Name: milestone_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.milestone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.milestone_id_seq OWNER TO gitea;

--
-- Name: milestone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.milestone_id_seq OWNED BY public.milestone.id;


--
-- Name: mirror; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.mirror (
    id bigint NOT NULL,
    repo_id bigint,
    "interval" bigint,
    enable_prune boolean DEFAULT true NOT NULL,
    updated_unix bigint,
    next_update_unix bigint
);


ALTER TABLE public.mirror OWNER TO gitea;

--
-- Name: mirror_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.mirror_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mirror_id_seq OWNER TO gitea;

--
-- Name: mirror_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.mirror_id_seq OWNED BY public.mirror.id;


--
-- Name: notice; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.notice (
    id bigint NOT NULL,
    type integer,
    description text,
    created_unix bigint
);


ALTER TABLE public.notice OWNER TO gitea;

--
-- Name: notice_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.notice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notice_id_seq OWNER TO gitea;

--
-- Name: notice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.notice_id_seq OWNED BY public.notice.id;


--
-- Name: notification; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.notification (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    repo_id bigint NOT NULL,
    status smallint NOT NULL,
    source smallint NOT NULL,
    issue_id bigint NOT NULL,
    commit_id character varying(255),
    updated_by bigint NOT NULL,
    created_unix bigint NOT NULL,
    updated_unix bigint NOT NULL
);


ALTER TABLE public.notification OWNER TO gitea;

--
-- Name: notification_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notification_id_seq OWNER TO gitea;

--
-- Name: notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.notification_id_seq OWNED BY public.notification.id;


--
-- Name: oauth2_session; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.oauth2_session (
    id character varying(100) NOT NULL,
    data text,
    created_unix bigint,
    updated_unix bigint,
    expires_unix bigint
);


ALTER TABLE public.oauth2_session OWNER TO gitea;

--
-- Name: org_user; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.org_user (
    id bigint NOT NULL,
    uid bigint,
    org_id bigint,
    is_public boolean
);


ALTER TABLE public.org_user OWNER TO gitea;

--
-- Name: org_user_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.org_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.org_user_id_seq OWNER TO gitea;

--
-- Name: org_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.org_user_id_seq OWNED BY public.org_user.id;


--
-- Name: protected_branch; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.protected_branch (
    id bigint NOT NULL,
    repo_id bigint,
    branch_name character varying(255),
    can_push boolean DEFAULT false NOT NULL,
    enable_whitelist boolean,
    whitelist_user_i_ds text,
    whitelist_team_i_ds text,
    enable_merge_whitelist boolean DEFAULT false NOT NULL,
    merge_whitelist_user_i_ds text,
    merge_whitelist_team_i_ds text,
    approvals_whitelist_user_i_ds text,
    approvals_whitelist_team_i_ds text,
    required_approvals bigint DEFAULT 0 NOT NULL,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.protected_branch OWNER TO gitea;

--
-- Name: protected_branch_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.protected_branch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.protected_branch_id_seq OWNER TO gitea;

--
-- Name: protected_branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.protected_branch_id_seq OWNED BY public.protected_branch.id;


--
-- Name: public_key; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.public_key (
    id bigint NOT NULL,
    owner_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    fingerprint character varying(255) NOT NULL,
    content text NOT NULL,
    mode integer DEFAULT 2 NOT NULL,
    type integer DEFAULT 1 NOT NULL,
    login_source_id bigint DEFAULT 0 NOT NULL,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.public_key OWNER TO gitea;

--
-- Name: public_key_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.public_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.public_key_id_seq OWNER TO gitea;

--
-- Name: public_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.public_key_id_seq OWNED BY public.public_key.id;


--
-- Name: pull_request; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.pull_request (
    id bigint NOT NULL,
    type integer,
    status integer,
    conflicted_files json,
    issue_id bigint,
    index bigint,
    head_repo_id bigint,
    base_repo_id bigint,
    head_user_name character varying(255),
    head_branch character varying(255),
    base_branch character varying(255),
    merge_base character varying(40),
    has_merged boolean,
    merged_commit_id character varying(40),
    merger_id bigint,
    merged_unix bigint
);


ALTER TABLE public.pull_request OWNER TO gitea;

--
-- Name: pull_request_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.pull_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pull_request_id_seq OWNER TO gitea;

--
-- Name: pull_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.pull_request_id_seq OWNED BY public.pull_request.id;


--
-- Name: reaction; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.reaction (
    id bigint NOT NULL,
    type character varying(255) NOT NULL,
    issue_id bigint NOT NULL,
    comment_id bigint,
    user_id bigint NOT NULL,
    created_unix bigint
);


ALTER TABLE public.reaction OWNER TO gitea;

--
-- Name: reaction_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.reaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reaction_id_seq OWNER TO gitea;

--
-- Name: reaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.reaction_id_seq OWNED BY public.reaction.id;


--
-- Name: release; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.release (
    id bigint NOT NULL,
    repo_id bigint,
    publisher_id bigint,
    tag_name character varying(255),
    lower_tag_name character varying(255),
    target character varying(255),
    title character varying(255),
    sha1 character varying(40),
    num_commits bigint,
    note text,
    is_draft boolean DEFAULT false NOT NULL,
    is_prerelease boolean DEFAULT false NOT NULL,
    is_tag boolean DEFAULT false NOT NULL,
    created_unix bigint
);


ALTER TABLE public.release OWNER TO gitea;

--
-- Name: release_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.release_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.release_id_seq OWNER TO gitea;

--
-- Name: release_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.release_id_seq OWNED BY public.release.id;


--
-- Name: repo_indexer_status; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.repo_indexer_status (
    id bigint NOT NULL,
    repo_id bigint,
    commit_sha character varying(40)
);


ALTER TABLE public.repo_indexer_status OWNER TO gitea;

--
-- Name: repo_indexer_status_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.repo_indexer_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repo_indexer_status_id_seq OWNER TO gitea;

--
-- Name: repo_indexer_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.repo_indexer_status_id_seq OWNED BY public.repo_indexer_status.id;


--
-- Name: repo_redirect; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.repo_redirect (
    id bigint NOT NULL,
    owner_id bigint,
    lower_name character varying(255) NOT NULL,
    redirect_repo_id bigint
);


ALTER TABLE public.repo_redirect OWNER TO gitea;

--
-- Name: repo_redirect_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.repo_redirect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repo_redirect_id_seq OWNER TO gitea;

--
-- Name: repo_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.repo_redirect_id_seq OWNED BY public.repo_redirect.id;


--
-- Name: repo_topic; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.repo_topic (
    repo_id bigint,
    topic_id bigint
);


ALTER TABLE public.repo_topic OWNER TO gitea;

--
-- Name: repo_unit; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.repo_unit (
    id bigint NOT NULL,
    repo_id bigint,
    type integer,
    config text,
    created_unix bigint
);


ALTER TABLE public.repo_unit OWNER TO gitea;

--
-- Name: repo_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.repo_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repo_unit_id_seq OWNER TO gitea;

--
-- Name: repo_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.repo_unit_id_seq OWNED BY public.repo_unit.id;


--
-- Name: repository; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.repository (
    id bigint NOT NULL,
    owner_id bigint,
    lower_name character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    website character varying(255),
    default_branch character varying(255),
    num_watches integer,
    num_stars integer,
    num_forks integer,
    num_issues integer,
    num_closed_issues integer,
    num_pulls integer,
    num_closed_pulls integer,
    num_milestones integer DEFAULT 0 NOT NULL,
    num_closed_milestones integer DEFAULT 0 NOT NULL,
    is_private boolean,
    is_empty boolean,
    is_archived boolean,
    is_mirror boolean,
    is_fork boolean DEFAULT false NOT NULL,
    fork_id bigint,
    size bigint DEFAULT 0 NOT NULL,
    is_fsck_enabled boolean DEFAULT true NOT NULL,
    close_issues_via_commit_in_any_branch boolean DEFAULT false NOT NULL,
    topics json,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.repository OWNER TO gitea;

--
-- Name: repository_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.repository_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repository_id_seq OWNER TO gitea;

--
-- Name: repository_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.repository_id_seq OWNED BY public.repository.id;


--
-- Name: review; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.review (
    id bigint NOT NULL,
    type integer,
    reviewer_id bigint,
    issue_id bigint,
    content character varying(255),
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.review OWNER TO gitea;

--
-- Name: review_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.review_id_seq OWNER TO gitea;

--
-- Name: review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.review_id_seq OWNED BY public.review.id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.star (
    id bigint NOT NULL,
    uid bigint,
    repo_id bigint
);


ALTER TABLE public.star OWNER TO gitea;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO gitea;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.id;


--
-- Name: stopwatch; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.stopwatch (
    id bigint NOT NULL,
    issue_id bigint,
    user_id bigint,
    created_unix bigint
);


ALTER TABLE public.stopwatch OWNER TO gitea;

--
-- Name: stopwatch_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.stopwatch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stopwatch_id_seq OWNER TO gitea;

--
-- Name: stopwatch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.stopwatch_id_seq OWNED BY public.stopwatch.id;


--
-- Name: team; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.team (
    id bigint NOT NULL,
    org_id bigint,
    lower_name character varying(255),
    name character varying(255),
    description character varying(255),
    authorize integer,
    num_repos integer,
    num_members integer
);


ALTER TABLE public.team OWNER TO gitea;

--
-- Name: team_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.team_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_id_seq OWNER TO gitea;

--
-- Name: team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.team_id_seq OWNED BY public.team.id;


--
-- Name: team_repo; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.team_repo (
    id bigint NOT NULL,
    org_id bigint,
    team_id bigint,
    repo_id bigint
);


ALTER TABLE public.team_repo OWNER TO gitea;

--
-- Name: team_repo_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.team_repo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_repo_id_seq OWNER TO gitea;

--
-- Name: team_repo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.team_repo_id_seq OWNED BY public.team_repo.id;


--
-- Name: team_unit; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.team_unit (
    id bigint NOT NULL,
    org_id bigint,
    team_id bigint,
    type integer
);


ALTER TABLE public.team_unit OWNER TO gitea;

--
-- Name: team_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.team_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_unit_id_seq OWNER TO gitea;

--
-- Name: team_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.team_unit_id_seq OWNED BY public.team_unit.id;


--
-- Name: team_user; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.team_user (
    id bigint NOT NULL,
    org_id bigint,
    team_id bigint,
    uid bigint
);


ALTER TABLE public.team_user OWNER TO gitea;

--
-- Name: team_user_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.team_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_user_id_seq OWNER TO gitea;

--
-- Name: team_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.team_user_id_seq OWNED BY public.team_user.id;


--
-- Name: topic; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.topic (
    id bigint NOT NULL,
    name character varying(25),
    repo_count integer,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.topic OWNER TO gitea;

--
-- Name: topic_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.topic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topic_id_seq OWNER TO gitea;

--
-- Name: topic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.topic_id_seq OWNED BY public.topic.id;


--
-- Name: tracked_time; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.tracked_time (
    id bigint NOT NULL,
    issue_id bigint,
    user_id bigint,
    created_unix bigint,
    "time" bigint
);


ALTER TABLE public.tracked_time OWNER TO gitea;

--
-- Name: tracked_time_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.tracked_time_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracked_time_id_seq OWNER TO gitea;

--
-- Name: tracked_time_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.tracked_time_id_seq OWNED BY public.tracked_time.id;


--
-- Name: two_factor; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.two_factor (
    id bigint NOT NULL,
    uid bigint,
    secret character varying(255),
    scratch_salt character varying(255),
    scratch_hash character varying(255),
    last_used_passcode character varying(10),
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.two_factor OWNER TO gitea;

--
-- Name: two_factor_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.two_factor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.two_factor_id_seq OWNER TO gitea;

--
-- Name: two_factor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.two_factor_id_seq OWNED BY public.two_factor.id;


--
-- Name: u2f_registration; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.u2f_registration (
    id bigint NOT NULL,
    name character varying(255),
    user_id bigint,
    raw bytea,
    counter integer,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.u2f_registration OWNER TO gitea;

--
-- Name: u2f_registration_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.u2f_registration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.u2f_registration_id_seq OWNER TO gitea;

--
-- Name: u2f_registration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.u2f_registration_id_seq OWNED BY public.u2f_registration.id;


--
-- Name: upload; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.upload (
    id bigint NOT NULL,
    uuid uuid,
    name character varying(255)
);


ALTER TABLE public.upload OWNER TO gitea;

--
-- Name: upload_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.upload_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_id_seq OWNER TO gitea;

--
-- Name: upload_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.upload_id_seq OWNED BY public.upload.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public."user" (
    id bigint NOT NULL,
    lower_name character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    full_name character varying(255),
    email character varying(255) NOT NULL,
    keep_email_private boolean,
    passwd character varying(255) NOT NULL,
    must_change_password boolean DEFAULT false NOT NULL,
    login_type integer,
    login_source bigint DEFAULT 0 NOT NULL,
    login_name character varying(255),
    type integer,
    location character varying(255),
    website character varying(255),
    rands character varying(10),
    salt character varying(10),
    language character varying(5),
    created_unix bigint,
    updated_unix bigint,
    last_login_unix bigint,
    last_repo_visibility boolean,
    max_repo_creation integer DEFAULT '-1'::integer NOT NULL,
    is_active boolean,
    is_admin boolean,
    allow_git_hook boolean,
    allow_import_local boolean,
    allow_create_organization boolean DEFAULT true,
    prohibit_login boolean DEFAULT false NOT NULL,
    avatar character varying(2048) NOT NULL,
    avatar_email character varying(255) NOT NULL,
    use_custom_avatar boolean,
    num_followers integer,
    num_following integer DEFAULT 0 NOT NULL,
    num_stars integer,
    num_repos integer,
    description character varying(255),
    num_teams integer,
    num_members integer,
    visibility integer DEFAULT 0 NOT NULL,
    diff_view_style character varying(255) DEFAULT ''::character varying NOT NULL,
    theme character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public."user" OWNER TO gitea;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO gitea;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: user_open_id; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.user_open_id (
    id bigint NOT NULL,
    uid bigint NOT NULL,
    uri character varying(255) NOT NULL,
    show boolean DEFAULT false
);


ALTER TABLE public.user_open_id OWNER TO gitea;

--
-- Name: user_open_id_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.user_open_id_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_open_id_id_seq OWNER TO gitea;

--
-- Name: user_open_id_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.user_open_id_id_seq OWNED BY public.user_open_id.id;


--
-- Name: version; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.version (
    id bigint NOT NULL,
    version bigint
);


ALTER TABLE public.version OWNER TO gitea;

--
-- Name: version_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.version_id_seq OWNER TO gitea;

--
-- Name: version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.version_id_seq OWNED BY public.version.id;


--
-- Name: watch; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.watch (
    id bigint NOT NULL,
    user_id bigint,
    repo_id bigint
);


ALTER TABLE public.watch OWNER TO gitea;

--
-- Name: watch_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.watch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.watch_id_seq OWNER TO gitea;

--
-- Name: watch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.watch_id_seq OWNED BY public.watch.id;


--
-- Name: webhook; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.webhook (
    id bigint NOT NULL,
    repo_id bigint,
    org_id bigint,
    url text,
    content_type integer,
    secret text,
    events text,
    is_ssl boolean,
    is_active boolean,
    hook_task_type integer,
    meta text,
    last_status integer,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.webhook OWNER TO gitea;

--
-- Name: webhook_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.webhook_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.webhook_id_seq OWNER TO gitea;

--
-- Name: webhook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.webhook_id_seq OWNED BY public.webhook.id;


--
-- Name: access id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.access ALTER COLUMN id SET DEFAULT nextval('public.access_id_seq'::regclass);


--
-- Name: access_token id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.access_token ALTER COLUMN id SET DEFAULT nextval('public.access_token_id_seq'::regclass);


--
-- Name: action id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action ALTER COLUMN id SET DEFAULT nextval('public.action_id_seq'::regclass);


--
-- Name: attachment id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.attachment ALTER COLUMN id SET DEFAULT nextval('public.attachment_id_seq'::regclass);


--
-- Name: collaboration id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.collaboration ALTER COLUMN id SET DEFAULT nextval('public.collaboration_id_seq'::regclass);


--
-- Name: comment id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);


--
-- Name: commit_status id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.commit_status ALTER COLUMN id SET DEFAULT nextval('public.commit_status_id_seq'::regclass);


--
-- Name: deleted_branch id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.deleted_branch ALTER COLUMN id SET DEFAULT nextval('public.deleted_branch_id_seq'::regclass);


--
-- Name: deploy_key id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.deploy_key ALTER COLUMN id SET DEFAULT nextval('public.deploy_key_id_seq'::regclass);


--
-- Name: email_address id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.email_address ALTER COLUMN id SET DEFAULT nextval('public.email_address_id_seq'::regclass);


--
-- Name: follow id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.follow ALTER COLUMN id SET DEFAULT nextval('public.follow_id_seq'::regclass);


--
-- Name: gpg_key id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.gpg_key ALTER COLUMN id SET DEFAULT nextval('public.gpg_key_id_seq'::regclass);


--
-- Name: hook_task id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.hook_task ALTER COLUMN id SET DEFAULT nextval('public.hook_task_id_seq'::regclass);


--
-- Name: issue id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue ALTER COLUMN id SET DEFAULT nextval('public.issue_id_seq'::regclass);


--
-- Name: issue_assignees id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_assignees ALTER COLUMN id SET DEFAULT nextval('public.issue_assignees_id_seq'::regclass);


--
-- Name: issue_dependency id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_dependency ALTER COLUMN id SET DEFAULT nextval('public.issue_dependency_id_seq'::regclass);


--
-- Name: issue_label id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_label ALTER COLUMN id SET DEFAULT nextval('public.issue_label_id_seq'::regclass);


--
-- Name: issue_user id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_user ALTER COLUMN id SET DEFAULT nextval('public.issue_user_id_seq'::regclass);


--
-- Name: issue_watch id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_watch ALTER COLUMN id SET DEFAULT nextval('public.issue_watch_id_seq'::regclass);


--
-- Name: label id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.label ALTER COLUMN id SET DEFAULT nextval('public.label_id_seq'::regclass);


--
-- Name: lfs_lock id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.lfs_lock ALTER COLUMN id SET DEFAULT nextval('public.lfs_lock_id_seq'::regclass);


--
-- Name: lfs_meta_object id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.lfs_meta_object ALTER COLUMN id SET DEFAULT nextval('public.lfs_meta_object_id_seq'::regclass);


--
-- Name: login_source id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.login_source ALTER COLUMN id SET DEFAULT nextval('public.login_source_id_seq'::regclass);


--
-- Name: milestone id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.milestone ALTER COLUMN id SET DEFAULT nextval('public.milestone_id_seq'::regclass);


--
-- Name: mirror id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.mirror ALTER COLUMN id SET DEFAULT nextval('public.mirror_id_seq'::regclass);


--
-- Name: notice id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.notice ALTER COLUMN id SET DEFAULT nextval('public.notice_id_seq'::regclass);


--
-- Name: notification id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.notification ALTER COLUMN id SET DEFAULT nextval('public.notification_id_seq'::regclass);


--
-- Name: org_user id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.org_user ALTER COLUMN id SET DEFAULT nextval('public.org_user_id_seq'::regclass);


--
-- Name: protected_branch id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.protected_branch ALTER COLUMN id SET DEFAULT nextval('public.protected_branch_id_seq'::regclass);


--
-- Name: public_key id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.public_key ALTER COLUMN id SET DEFAULT nextval('public.public_key_id_seq'::regclass);


--
-- Name: pull_request id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.pull_request ALTER COLUMN id SET DEFAULT nextval('public.pull_request_id_seq'::regclass);


--
-- Name: reaction id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.reaction ALTER COLUMN id SET DEFAULT nextval('public.reaction_id_seq'::regclass);


--
-- Name: release id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.release ALTER COLUMN id SET DEFAULT nextval('public.release_id_seq'::regclass);


--
-- Name: repo_indexer_status id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repo_indexer_status ALTER COLUMN id SET DEFAULT nextval('public.repo_indexer_status_id_seq'::regclass);


--
-- Name: repo_redirect id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repo_redirect ALTER COLUMN id SET DEFAULT nextval('public.repo_redirect_id_seq'::regclass);


--
-- Name: repo_unit id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repo_unit ALTER COLUMN id SET DEFAULT nextval('public.repo_unit_id_seq'::regclass);


--
-- Name: repository id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repository ALTER COLUMN id SET DEFAULT nextval('public.repository_id_seq'::regclass);


--
-- Name: review id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.review ALTER COLUMN id SET DEFAULT nextval('public.review_id_seq'::regclass);


--
-- Name: star id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.star ALTER COLUMN id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Name: stopwatch id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.stopwatch ALTER COLUMN id SET DEFAULT nextval('public.stopwatch_id_seq'::regclass);


--
-- Name: team id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.team ALTER COLUMN id SET DEFAULT nextval('public.team_id_seq'::regclass);


--
-- Name: team_repo id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.team_repo ALTER COLUMN id SET DEFAULT nextval('public.team_repo_id_seq'::regclass);


--
-- Name: team_unit id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.team_unit ALTER COLUMN id SET DEFAULT nextval('public.team_unit_id_seq'::regclass);


--
-- Name: team_user id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.team_user ALTER COLUMN id SET DEFAULT nextval('public.team_user_id_seq'::regclass);


--
-- Name: topic id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.topic ALTER COLUMN id SET DEFAULT nextval('public.topic_id_seq'::regclass);


--
-- Name: tracked_time id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.tracked_time ALTER COLUMN id SET DEFAULT nextval('public.tracked_time_id_seq'::regclass);


--
-- Name: two_factor id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.two_factor ALTER COLUMN id SET DEFAULT nextval('public.two_factor_id_seq'::regclass);


--
-- Name: u2f_registration id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.u2f_registration ALTER COLUMN id SET DEFAULT nextval('public.u2f_registration_id_seq'::regclass);


--
-- Name: upload id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.upload ALTER COLUMN id SET DEFAULT nextval('public.upload_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: user_open_id id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.user_open_id ALTER COLUMN id SET DEFAULT nextval('public.user_open_id_id_seq'::regclass);


--
-- Name: version id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.version ALTER COLUMN id SET DEFAULT nextval('public.version_id_seq'::regclass);


--
-- Name: watch id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.watch ALTER COLUMN id SET DEFAULT nextval('public.watch_id_seq'::regclass);


--
-- Name: webhook id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.webhook ALTER COLUMN id SET DEFAULT nextval('public.webhook_id_seq'::regclass);


--
-- Data for Name: access; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.access (id, user_id, repo_id, mode) FROM stdin;
\.


--
-- Name: access_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.access_id_seq', 1, false);


--
-- Data for Name: access_token; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.access_token (id, uid, name, sha1, created_unix, updated_unix) FROM stdin;
\.


--
-- Name: access_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.access_token_id_seq', 1, false);


--
-- Data for Name: action; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.action (id, user_id, op_type, act_user_id, repo_id, comment_id, is_deleted, ref_name, is_private, content, created_unix) FROM stdin;
\.


--
-- Name: action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.action_id_seq', 1, false);


--
-- Data for Name: attachment; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.attachment (id, uuid, issue_id, release_id, comment_id, name, download_count, size, created_unix) FROM stdin;
\.


--
-- Name: attachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.attachment_id_seq', 1, false);


--
-- Data for Name: collaboration; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.collaboration (id, repo_id, user_id, mode) FROM stdin;
\.


--
-- Name: collaboration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.collaboration_id_seq', 1, false);


--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.comment (id, type, poster_id, issue_id, label_id, old_milestone_id, milestone_id, assignee_id, removed_assignee, old_title, new_title, dependent_issue_id, commit_id, line, tree_path, content, patch, created_unix, updated_unix, commit_sha, review_id, invalidated) FROM stdin;
\.


--
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.comment_id_seq', 1, false);


--
-- Data for Name: commit_status; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.commit_status (id, index, repo_id, state, sha, target_url, description, context, creator_id, created_unix, updated_unix) FROM stdin;
\.


--
-- Name: commit_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.commit_status_id_seq', 1, false);


--
-- Data for Name: deleted_branch; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.deleted_branch (id, repo_id, name, commit, deleted_by_id, deleted_unix) FROM stdin;
\.


--
-- Name: deleted_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.deleted_branch_id_seq', 1, false);


--
-- Data for Name: deploy_key; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.deploy_key (id, key_id, repo_id, name, fingerprint, mode, created_unix, updated_unix) FROM stdin;
\.


--
-- Name: deploy_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.deploy_key_id_seq', 1, false);


--
-- Data for Name: email_address; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.email_address (id, uid, email, is_activated) FROM stdin;
\.


--
-- Name: email_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.email_address_id_seq', 1, false);


--
-- Data for Name: external_login_user; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.external_login_user (external_id, user_id, login_source_id) FROM stdin;
\.


--
-- Data for Name: follow; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.follow (id, user_id, follow_id) FROM stdin;
\.


--
-- Name: follow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.follow_id_seq', 1, false);


--
-- Data for Name: gpg_key; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.gpg_key (id, owner_id, key_id, primary_key_id, content, created_unix, expired_unix, added_unix, emails, can_sign, can_encrypt_comms, can_encrypt_storage, can_certify) FROM stdin;
\.


--
-- Name: gpg_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.gpg_key_id_seq', 1, false);


--
-- Data for Name: hook_task; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.hook_task (id, repo_id, hook_id, uuid, type, url, payload_content, content_type, event_type, is_ssl, is_delivered, delivered, is_succeed, request_content, response_content) FROM stdin;
\.


--
-- Name: hook_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.hook_task_id_seq', 1, false);


--
-- Data for Name: issue; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.issue (id, repo_id, index, poster_id, name, content, milestone_id, priority, is_closed, is_pull, num_comments, ref, deadline_unix, created_unix, updated_unix, closed_unix, is_locked) FROM stdin;
\.


--
-- Data for Name: issue_assignees; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.issue_assignees (id, assignee_id, issue_id) FROM stdin;
\.


--
-- Name: issue_assignees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.issue_assignees_id_seq', 1, false);


--
-- Data for Name: issue_dependency; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.issue_dependency (id, user_id, issue_id, dependency_id, created_unix, updated_unix) FROM stdin;
\.


--
-- Name: issue_dependency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.issue_dependency_id_seq', 1, false);


--
-- Name: issue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.issue_id_seq', 1, false);


--
-- Data for Name: issue_label; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.issue_label (id, issue_id, label_id) FROM stdin;
\.


--
-- Name: issue_label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.issue_label_id_seq', 1, false);


--
-- Data for Name: issue_user; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.issue_user (id, uid, issue_id, is_read, is_mentioned) FROM stdin;
\.


--
-- Name: issue_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.issue_user_id_seq', 1, false);


--
-- Data for Name: issue_watch; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.issue_watch (id, user_id, issue_id, is_watching, created_unix, updated_unix) FROM stdin;
\.


--
-- Name: issue_watch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.issue_watch_id_seq', 1, false);


--
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.label (id, repo_id, name, description, color, num_issues, num_closed_issues, query_string, is_selected) FROM stdin;
\.


--
-- Name: label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.label_id_seq', 1, false);


--
-- Data for Name: lfs_lock; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.lfs_lock (id, repo_id, owner_id, path, created) FROM stdin;
\.


--
-- Name: lfs_lock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.lfs_lock_id_seq', 1, false);


--
-- Data for Name: lfs_meta_object; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.lfs_meta_object (id, oid, size, repository_id, created_unix) FROM stdin;
\.


--
-- Name: lfs_meta_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.lfs_meta_object_id_seq', 1, false);


--
-- Data for Name: login_source; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.login_source (id, type, name, is_actived, is_sync_enabled, cfg, created_unix, updated_unix) FROM stdin;
\.


--
-- Name: login_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.login_source_id_seq', 1, false);


--
-- Data for Name: milestone; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.milestone (id, repo_id, name, content, is_closed, num_issues, num_closed_issues, completeness, deadline_unix, closed_date_unix) FROM stdin;
\.


--
-- Name: milestone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.milestone_id_seq', 1, false);


--
-- Data for Name: mirror; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.mirror (id, repo_id, "interval", enable_prune, updated_unix, next_update_unix) FROM stdin;
\.


--
-- Name: mirror_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.mirror_id_seq', 1, false);


--
-- Data for Name: notice; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.notice (id, type, description, created_unix) FROM stdin;
\.


--
-- Name: notice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.notice_id_seq', 1, false);


--
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.notification (id, user_id, repo_id, status, source, issue_id, commit_id, updated_by, created_unix, updated_unix) FROM stdin;
\.


--
-- Name: notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.notification_id_seq', 1, false);


--
-- Data for Name: oauth2_session; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.oauth2_session (id, data, created_unix, updated_unix, expires_unix) FROM stdin;
\.


--
-- Data for Name: org_user; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.org_user (id, uid, org_id, is_public) FROM stdin;
\.


--
-- Name: org_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.org_user_id_seq', 1, false);


--
-- Data for Name: protected_branch; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.protected_branch (id, repo_id, branch_name, can_push, enable_whitelist, whitelist_user_i_ds, whitelist_team_i_ds, enable_merge_whitelist, merge_whitelist_user_i_ds, merge_whitelist_team_i_ds, approvals_whitelist_user_i_ds, approvals_whitelist_team_i_ds, required_approvals, created_unix, updated_unix) FROM stdin;
\.


--
-- Name: protected_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.protected_branch_id_seq', 1, false);


--
-- Data for Name: public_key; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.public_key (id, owner_id, name, fingerprint, content, mode, type, login_source_id, created_unix, updated_unix) FROM stdin;
\.


--
-- Name: public_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.public_key_id_seq', 1, false);


--
-- Data for Name: pull_request; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.pull_request (id, type, status, conflicted_files, issue_id, index, head_repo_id, base_repo_id, head_user_name, head_branch, base_branch, merge_base, has_merged, merged_commit_id, merger_id, merged_unix) FROM stdin;
\.


--
-- Name: pull_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.pull_request_id_seq', 1, false);


--
-- Data for Name: reaction; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.reaction (id, type, issue_id, comment_id, user_id, created_unix) FROM stdin;
\.


--
-- Name: reaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.reaction_id_seq', 1, false);


--
-- Data for Name: release; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.release (id, repo_id, publisher_id, tag_name, lower_tag_name, target, title, sha1, num_commits, note, is_draft, is_prerelease, is_tag, created_unix) FROM stdin;
\.


--
-- Name: release_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.release_id_seq', 1, false);


--
-- Data for Name: repo_indexer_status; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.repo_indexer_status (id, repo_id, commit_sha) FROM stdin;
\.


--
-- Name: repo_indexer_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.repo_indexer_status_id_seq', 1, false);


--
-- Data for Name: repo_redirect; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.repo_redirect (id, owner_id, lower_name, redirect_repo_id) FROM stdin;
\.


--
-- Name: repo_redirect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.repo_redirect_id_seq', 1, false);


--
-- Data for Name: repo_topic; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.repo_topic (repo_id, topic_id) FROM stdin;
\.


--
-- Data for Name: repo_unit; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.repo_unit (id, repo_id, type, config, created_unix) FROM stdin;
\.


--
-- Name: repo_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.repo_unit_id_seq', 1, false);


--
-- Data for Name: repository; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.repository (id, owner_id, lower_name, name, description, website, default_branch, num_watches, num_stars, num_forks, num_issues, num_closed_issues, num_pulls, num_closed_pulls, num_milestones, num_closed_milestones, is_private, is_empty, is_archived, is_mirror, is_fork, fork_id, size, is_fsck_enabled, close_issues_via_commit_in_any_branch, topics, created_unix, updated_unix) FROM stdin;
\.


--
-- Name: repository_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.repository_id_seq', 1, false);


--
-- Data for Name: review; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.review (id, type, reviewer_id, issue_id, content, created_unix, updated_unix) FROM stdin;
\.


--
-- Name: review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.review_id_seq', 1, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.star (id, uid, repo_id) FROM stdin;
\.


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.star_id_seq', 1, false);


--
-- Data for Name: stopwatch; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.stopwatch (id, issue_id, user_id, created_unix) FROM stdin;
\.


--
-- Name: stopwatch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.stopwatch_id_seq', 1, false);


--
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.team (id, org_id, lower_name, name, description, authorize, num_repos, num_members) FROM stdin;
\.


--
-- Name: team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.team_id_seq', 1, false);


--
-- Data for Name: team_repo; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.team_repo (id, org_id, team_id, repo_id) FROM stdin;
\.


--
-- Name: team_repo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.team_repo_id_seq', 1, false);


--
-- Data for Name: team_unit; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.team_unit (id, org_id, team_id, type) FROM stdin;
\.


--
-- Name: team_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.team_unit_id_seq', 1, false);


--
-- Data for Name: team_user; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.team_user (id, org_id, team_id, uid) FROM stdin;
\.


--
-- Name: team_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.team_user_id_seq', 1, false);


--
-- Data for Name: topic; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.topic (id, name, repo_count, created_unix, updated_unix) FROM stdin;
\.


--
-- Name: topic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.topic_id_seq', 1, false);


--
-- Data for Name: tracked_time; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.tracked_time (id, issue_id, user_id, created_unix, "time") FROM stdin;
\.


--
-- Name: tracked_time_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.tracked_time_id_seq', 1, false);


--
-- Data for Name: two_factor; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.two_factor (id, uid, secret, scratch_salt, scratch_hash, last_used_passcode, created_unix, updated_unix) FROM stdin;
\.


--
-- Name: two_factor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.two_factor_id_seq', 1, false);


--
-- Data for Name: u2f_registration; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.u2f_registration (id, name, user_id, raw, counter, created_unix, updated_unix) FROM stdin;
\.


--
-- Name: u2f_registration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.u2f_registration_id_seq', 1, false);


--
-- Data for Name: upload; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.upload (id, uuid, name) FROM stdin;
\.


--
-- Name: upload_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.upload_id_seq', 1, false);


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public."user" (id, lower_name, name, full_name, email, keep_email_private, passwd, must_change_password, login_type, login_source, login_name, type, location, website, rands, salt, language, created_unix, updated_unix, last_login_unix, last_repo_visibility, max_repo_creation, is_active, is_admin, allow_git_hook, allow_import_local, allow_create_organization, prohibit_login, avatar, avatar_email, use_custom_avatar, num_followers, num_following, num_stars, num_repos, description, num_teams, num_members, visibility, diff_view_style, theme) FROM stdin;
1	admingit	admingit		admin@admin.dockerproject	f	b02f8f64d17cd58037efcef770fa3b9108989b025f7b11757a3804da69933d4e21fb408b594a70e667b79500d64f059e12ea	f	0	0		0			aafs3icri3	ZXscprjRv7		1551543475	1551543475	0	f	-1	t	t	f	f	t	f	c96db97c5f77319575fa37c9c27ed130	admin@admin.dockerproject	f	0	0	0	0		0	0	0		gitea
\.


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.user_id_seq', 1, true);


--
-- Data for Name: user_open_id; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.user_open_id (id, uid, uri, show) FROM stdin;
\.


--
-- Name: user_open_id_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.user_open_id_id_seq', 1, false);


--
-- Data for Name: version; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.version (id, version) FROM stdin;
1	81
\.


--
-- Name: version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.version_id_seq', 1, true);


--
-- Data for Name: watch; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.watch (id, user_id, repo_id) FROM stdin;
\.


--
-- Name: watch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.watch_id_seq', 1, false);


--
-- Data for Name: webhook; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.webhook (id, repo_id, org_id, url, content_type, secret, events, is_ssl, is_active, hook_task_type, meta, last_status, created_unix, updated_unix) FROM stdin;
\.


--
-- Name: webhook_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.webhook_id_seq', 1, false);


--
-- Name: access access_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.access
    ADD CONSTRAINT access_pkey PRIMARY KEY (id);


--
-- Name: access_token access_token_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.access_token
    ADD CONSTRAINT access_token_pkey PRIMARY KEY (id);


--
-- Name: action action_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action
    ADD CONSTRAINT action_pkey PRIMARY KEY (id);


--
-- Name: attachment attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.attachment
    ADD CONSTRAINT attachment_pkey PRIMARY KEY (id);


--
-- Name: collaboration collaboration_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.collaboration
    ADD CONSTRAINT collaboration_pkey PRIMARY KEY (id);


--
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- Name: commit_status commit_status_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.commit_status
    ADD CONSTRAINT commit_status_pkey PRIMARY KEY (id);


--
-- Name: deleted_branch deleted_branch_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.deleted_branch
    ADD CONSTRAINT deleted_branch_pkey PRIMARY KEY (id);


--
-- Name: deploy_key deploy_key_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.deploy_key
    ADD CONSTRAINT deploy_key_pkey PRIMARY KEY (id);


--
-- Name: email_address email_address_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.email_address
    ADD CONSTRAINT email_address_pkey PRIMARY KEY (id);


--
-- Name: external_login_user external_login_user_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.external_login_user
    ADD CONSTRAINT external_login_user_pkey PRIMARY KEY (external_id, login_source_id);


--
-- Name: follow follow_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.follow
    ADD CONSTRAINT follow_pkey PRIMARY KEY (id);


--
-- Name: gpg_key gpg_key_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.gpg_key
    ADD CONSTRAINT gpg_key_pkey PRIMARY KEY (id);


--
-- Name: hook_task hook_task_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.hook_task
    ADD CONSTRAINT hook_task_pkey PRIMARY KEY (id);


--
-- Name: issue_assignees issue_assignees_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_assignees
    ADD CONSTRAINT issue_assignees_pkey PRIMARY KEY (id);


--
-- Name: issue_dependency issue_dependency_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_dependency
    ADD CONSTRAINT issue_dependency_pkey PRIMARY KEY (id);


--
-- Name: issue_label issue_label_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_label
    ADD CONSTRAINT issue_label_pkey PRIMARY KEY (id);


--
-- Name: issue issue_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue
    ADD CONSTRAINT issue_pkey PRIMARY KEY (id);


--
-- Name: issue_user issue_user_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_user
    ADD CONSTRAINT issue_user_pkey PRIMARY KEY (id);


--
-- Name: issue_watch issue_watch_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_watch
    ADD CONSTRAINT issue_watch_pkey PRIMARY KEY (id);


--
-- Name: label label_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.label
    ADD CONSTRAINT label_pkey PRIMARY KEY (id);


--
-- Name: lfs_lock lfs_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.lfs_lock
    ADD CONSTRAINT lfs_lock_pkey PRIMARY KEY (id);


--
-- Name: lfs_meta_object lfs_meta_object_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.lfs_meta_object
    ADD CONSTRAINT lfs_meta_object_pkey PRIMARY KEY (id);


--
-- Name: login_source login_source_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.login_source
    ADD CONSTRAINT login_source_pkey PRIMARY KEY (id);


--
-- Name: milestone milestone_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.milestone
    ADD CONSTRAINT milestone_pkey PRIMARY KEY (id);


--
-- Name: mirror mirror_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.mirror
    ADD CONSTRAINT mirror_pkey PRIMARY KEY (id);


--
-- Name: notice notice_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.notice
    ADD CONSTRAINT notice_pkey PRIMARY KEY (id);


--
-- Name: notification notification_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (id);


--
-- Name: oauth2_session oauth2_session_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.oauth2_session
    ADD CONSTRAINT oauth2_session_pkey PRIMARY KEY (id);


--
-- Name: org_user org_user_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.org_user
    ADD CONSTRAINT org_user_pkey PRIMARY KEY (id);


--
-- Name: protected_branch protected_branch_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.protected_branch
    ADD CONSTRAINT protected_branch_pkey PRIMARY KEY (id);


--
-- Name: public_key public_key_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.public_key
    ADD CONSTRAINT public_key_pkey PRIMARY KEY (id);


--
-- Name: pull_request pull_request_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.pull_request
    ADD CONSTRAINT pull_request_pkey PRIMARY KEY (id);


--
-- Name: reaction reaction_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.reaction
    ADD CONSTRAINT reaction_pkey PRIMARY KEY (id);


--
-- Name: release release_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.release
    ADD CONSTRAINT release_pkey PRIMARY KEY (id);


--
-- Name: repo_indexer_status repo_indexer_status_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repo_indexer_status
    ADD CONSTRAINT repo_indexer_status_pkey PRIMARY KEY (id);


--
-- Name: repo_redirect repo_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repo_redirect
    ADD CONSTRAINT repo_redirect_pkey PRIMARY KEY (id);


--
-- Name: repo_unit repo_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repo_unit
    ADD CONSTRAINT repo_unit_pkey PRIMARY KEY (id);


--
-- Name: repository repository_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repository
    ADD CONSTRAINT repository_pkey PRIMARY KEY (id);


--
-- Name: review review_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_pkey PRIMARY KEY (id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (id);


--
-- Name: stopwatch stopwatch_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.stopwatch
    ADD CONSTRAINT stopwatch_pkey PRIMARY KEY (id);


--
-- Name: team team_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_pkey PRIMARY KEY (id);


--
-- Name: team_repo team_repo_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.team_repo
    ADD CONSTRAINT team_repo_pkey PRIMARY KEY (id);


--
-- Name: team_unit team_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.team_unit
    ADD CONSTRAINT team_unit_pkey PRIMARY KEY (id);


--
-- Name: team_user team_user_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.team_user
    ADD CONSTRAINT team_user_pkey PRIMARY KEY (id);


--
-- Name: topic topic_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.topic
    ADD CONSTRAINT topic_pkey PRIMARY KEY (id);


--
-- Name: tracked_time tracked_time_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.tracked_time
    ADD CONSTRAINT tracked_time_pkey PRIMARY KEY (id);


--
-- Name: two_factor two_factor_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.two_factor
    ADD CONSTRAINT two_factor_pkey PRIMARY KEY (id);


--
-- Name: u2f_registration u2f_registration_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.u2f_registration
    ADD CONSTRAINT u2f_registration_pkey PRIMARY KEY (id);


--
-- Name: upload upload_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.upload
    ADD CONSTRAINT upload_pkey PRIMARY KEY (id);


--
-- Name: user_open_id user_open_id_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.user_open_id
    ADD CONSTRAINT user_open_id_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: version version_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.version
    ADD CONSTRAINT version_pkey PRIMARY KEY (id);


--
-- Name: watch watch_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.watch
    ADD CONSTRAINT watch_pkey PRIMARY KEY (id);


--
-- Name: webhook webhook_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.webhook
    ADD CONSTRAINT webhook_pkey PRIMARY KEY (id);


--
-- Name: IDX_access_token_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_access_token_created_unix" ON public.access_token USING btree (created_unix);


--
-- Name: IDX_access_token_uid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_access_token_uid" ON public.access_token USING btree (uid);


--
-- Name: IDX_access_token_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_access_token_updated_unix" ON public.access_token USING btree (updated_unix);


--
-- Name: IDX_action_act_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_act_user_id" ON public.action USING btree (act_user_id);


--
-- Name: IDX_action_comment_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_comment_id" ON public.action USING btree (comment_id);


--
-- Name: IDX_action_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_created_unix" ON public.action USING btree (created_unix);


--
-- Name: IDX_action_is_deleted; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_is_deleted" ON public.action USING btree (is_deleted);


--
-- Name: IDX_action_is_private; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_is_private" ON public.action USING btree (is_private);


--
-- Name: IDX_action_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_repo_id" ON public.action USING btree (repo_id);


--
-- Name: IDX_action_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_user_id" ON public.action USING btree (user_id);


--
-- Name: IDX_attachment_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_attachment_issue_id" ON public.attachment USING btree (issue_id);


--
-- Name: IDX_attachment_release_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_attachment_release_id" ON public.attachment USING btree (release_id);


--
-- Name: IDX_collaboration_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_collaboration_repo_id" ON public.collaboration USING btree (repo_id);


--
-- Name: IDX_collaboration_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_collaboration_user_id" ON public.collaboration USING btree (user_id);


--
-- Name: IDX_comment_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_comment_created_unix" ON public.comment USING btree (created_unix);


--
-- Name: IDX_comment_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_comment_issue_id" ON public.comment USING btree (issue_id);


--
-- Name: IDX_comment_poster_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_comment_poster_id" ON public.comment USING btree (poster_id);


--
-- Name: IDX_comment_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_comment_updated_unix" ON public.comment USING btree (updated_unix);


--
-- Name: IDX_commit_status_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_commit_status_created_unix" ON public.commit_status USING btree (created_unix);


--
-- Name: IDX_commit_status_index; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_commit_status_index" ON public.commit_status USING btree (index);


--
-- Name: IDX_commit_status_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_commit_status_repo_id" ON public.commit_status USING btree (repo_id);


--
-- Name: IDX_commit_status_sha; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_commit_status_sha" ON public.commit_status USING btree (sha);


--
-- Name: IDX_commit_status_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_commit_status_updated_unix" ON public.commit_status USING btree (updated_unix);


--
-- Name: IDX_deleted_branch_deleted_by_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_deleted_branch_deleted_by_id" ON public.deleted_branch USING btree (deleted_by_id);


--
-- Name: IDX_deleted_branch_deleted_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_deleted_branch_deleted_unix" ON public.deleted_branch USING btree (deleted_unix);


--
-- Name: IDX_deleted_branch_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_deleted_branch_repo_id" ON public.deleted_branch USING btree (repo_id);


--
-- Name: IDX_deploy_key_key_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_deploy_key_key_id" ON public.deploy_key USING btree (key_id);


--
-- Name: IDX_deploy_key_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_deploy_key_repo_id" ON public.deploy_key USING btree (repo_id);


--
-- Name: IDX_email_address_uid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_email_address_uid" ON public.email_address USING btree (uid);


--
-- Name: IDX_external_login_user_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_external_login_user_user_id" ON public.external_login_user USING btree (user_id);


--
-- Name: IDX_gpg_key_key_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_gpg_key_key_id" ON public.gpg_key USING btree (key_id);


--
-- Name: IDX_gpg_key_owner_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_gpg_key_owner_id" ON public.gpg_key USING btree (owner_id);


--
-- Name: IDX_hook_task_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_hook_task_repo_id" ON public.hook_task USING btree (repo_id);


--
-- Name: IDX_issue_assignees_assignee_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_assignees_assignee_id" ON public.issue_assignees USING btree (assignee_id);


--
-- Name: IDX_issue_assignees_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_assignees_issue_id" ON public.issue_assignees USING btree (issue_id);


--
-- Name: IDX_issue_closed_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_closed_unix" ON public.issue USING btree (closed_unix);


--
-- Name: IDX_issue_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_created_unix" ON public.issue USING btree (created_unix);


--
-- Name: IDX_issue_deadline_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_deadline_unix" ON public.issue USING btree (deadline_unix);


--
-- Name: IDX_issue_is_closed; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_is_closed" ON public.issue USING btree (is_closed);


--
-- Name: IDX_issue_is_pull; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_is_pull" ON public.issue USING btree (is_pull);


--
-- Name: IDX_issue_milestone_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_milestone_id" ON public.issue USING btree (milestone_id);


--
-- Name: IDX_issue_poster_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_poster_id" ON public.issue USING btree (poster_id);


--
-- Name: IDX_issue_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_repo_id" ON public.issue USING btree (repo_id);


--
-- Name: IDX_issue_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_updated_unix" ON public.issue USING btree (updated_unix);


--
-- Name: IDX_issue_user_uid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_user_uid" ON public.issue_user USING btree (uid);


--
-- Name: IDX_label_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_label_repo_id" ON public.label USING btree (repo_id);


--
-- Name: IDX_lfs_lock_owner_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_lfs_lock_owner_id" ON public.lfs_lock USING btree (owner_id);


--
-- Name: IDX_lfs_lock_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_lfs_lock_repo_id" ON public.lfs_lock USING btree (repo_id);


--
-- Name: IDX_lfs_meta_object_oid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_lfs_meta_object_oid" ON public.lfs_meta_object USING btree (oid);


--
-- Name: IDX_lfs_meta_object_repository_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_lfs_meta_object_repository_id" ON public.lfs_meta_object USING btree (repository_id);


--
-- Name: IDX_login_source_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_login_source_created_unix" ON public.login_source USING btree (created_unix);


--
-- Name: IDX_login_source_is_actived; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_login_source_is_actived" ON public.login_source USING btree (is_actived);


--
-- Name: IDX_login_source_is_sync_enabled; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_login_source_is_sync_enabled" ON public.login_source USING btree (is_sync_enabled);


--
-- Name: IDX_login_source_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_login_source_updated_unix" ON public.login_source USING btree (updated_unix);


--
-- Name: IDX_milestone_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_milestone_repo_id" ON public.milestone USING btree (repo_id);


--
-- Name: IDX_mirror_next_update_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_mirror_next_update_unix" ON public.mirror USING btree (next_update_unix);


--
-- Name: IDX_mirror_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_mirror_repo_id" ON public.mirror USING btree (repo_id);


--
-- Name: IDX_mirror_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_mirror_updated_unix" ON public.mirror USING btree (updated_unix);


--
-- Name: IDX_notice_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notice_created_unix" ON public.notice USING btree (created_unix);


--
-- Name: IDX_notification_commit_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notification_commit_id" ON public.notification USING btree (commit_id);


--
-- Name: IDX_notification_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notification_created_unix" ON public.notification USING btree (created_unix);


--
-- Name: IDX_notification_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notification_issue_id" ON public.notification USING btree (issue_id);


--
-- Name: IDX_notification_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notification_repo_id" ON public.notification USING btree (repo_id);


--
-- Name: IDX_notification_source; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notification_source" ON public.notification USING btree (source);


--
-- Name: IDX_notification_status; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notification_status" ON public.notification USING btree (status);


--
-- Name: IDX_notification_updated_by; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notification_updated_by" ON public.notification USING btree (updated_by);


--
-- Name: IDX_notification_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notification_updated_unix" ON public.notification USING btree (updated_unix);


--
-- Name: IDX_notification_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notification_user_id" ON public.notification USING btree (user_id);


--
-- Name: IDX_oauth2_session_expires_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_oauth2_session_expires_unix" ON public.oauth2_session USING btree (expires_unix);


--
-- Name: IDX_org_user_is_public; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_org_user_is_public" ON public.org_user USING btree (is_public);


--
-- Name: IDX_org_user_org_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_org_user_org_id" ON public.org_user USING btree (org_id);


--
-- Name: IDX_org_user_uid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_org_user_uid" ON public.org_user USING btree (uid);


--
-- Name: IDX_public_key_fingerprint; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_public_key_fingerprint" ON public.public_key USING btree (fingerprint);


--
-- Name: IDX_public_key_owner_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_public_key_owner_id" ON public.public_key USING btree (owner_id);


--
-- Name: IDX_pull_request_base_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_pull_request_base_repo_id" ON public.pull_request USING btree (base_repo_id);


--
-- Name: IDX_pull_request_has_merged; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_pull_request_has_merged" ON public.pull_request USING btree (has_merged);


--
-- Name: IDX_pull_request_head_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_pull_request_head_repo_id" ON public.pull_request USING btree (head_repo_id);


--
-- Name: IDX_pull_request_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_pull_request_issue_id" ON public.pull_request USING btree (issue_id);


--
-- Name: IDX_pull_request_merged_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_pull_request_merged_unix" ON public.pull_request USING btree (merged_unix);


--
-- Name: IDX_pull_request_merger_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_pull_request_merger_id" ON public.pull_request USING btree (merger_id);


--
-- Name: IDX_reaction_comment_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_reaction_comment_id" ON public.reaction USING btree (comment_id);


--
-- Name: IDX_reaction_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_reaction_created_unix" ON public.reaction USING btree (created_unix);


--
-- Name: IDX_reaction_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_reaction_issue_id" ON public.reaction USING btree (issue_id);


--
-- Name: IDX_reaction_type; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_reaction_type" ON public.reaction USING btree (type);


--
-- Name: IDX_reaction_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_reaction_user_id" ON public.reaction USING btree (user_id);


--
-- Name: IDX_release_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_release_created_unix" ON public.release USING btree (created_unix);


--
-- Name: IDX_release_publisher_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_release_publisher_id" ON public.release USING btree (publisher_id);


--
-- Name: IDX_release_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_release_repo_id" ON public.release USING btree (repo_id);


--
-- Name: IDX_release_tag_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_release_tag_name" ON public.release USING btree (tag_name);


--
-- Name: IDX_repo_indexer_status_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repo_indexer_status_repo_id" ON public.repo_indexer_status USING btree (repo_id);


--
-- Name: IDX_repo_redirect_lower_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repo_redirect_lower_name" ON public.repo_redirect USING btree (lower_name);


--
-- Name: IDX_repo_unit_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repo_unit_created_unix" ON public.repo_unit USING btree (created_unix);


--
-- Name: IDX_repo_unit_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repo_unit_s" ON public.repo_unit USING btree (repo_id, type);


--
-- Name: IDX_repository_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_created_unix" ON public.repository USING btree (created_unix);


--
-- Name: IDX_repository_fork_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_fork_id" ON public.repository USING btree (fork_id);


--
-- Name: IDX_repository_is_archived; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_is_archived" ON public.repository USING btree (is_archived);


--
-- Name: IDX_repository_is_empty; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_is_empty" ON public.repository USING btree (is_empty);


--
-- Name: IDX_repository_is_fork; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_is_fork" ON public.repository USING btree (is_fork);


--
-- Name: IDX_repository_is_mirror; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_is_mirror" ON public.repository USING btree (is_mirror);


--
-- Name: IDX_repository_is_private; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_is_private" ON public.repository USING btree (is_private);


--
-- Name: IDX_repository_lower_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_lower_name" ON public.repository USING btree (lower_name);


--
-- Name: IDX_repository_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_name" ON public.repository USING btree (name);


--
-- Name: IDX_repository_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_updated_unix" ON public.repository USING btree (updated_unix);


--
-- Name: IDX_review_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_review_created_unix" ON public.review USING btree (created_unix);


--
-- Name: IDX_review_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_review_issue_id" ON public.review USING btree (issue_id);


--
-- Name: IDX_review_reviewer_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_review_reviewer_id" ON public.review USING btree (reviewer_id);


--
-- Name: IDX_review_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_review_updated_unix" ON public.review USING btree (updated_unix);


--
-- Name: IDX_stopwatch_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_stopwatch_issue_id" ON public.stopwatch USING btree (issue_id);


--
-- Name: IDX_stopwatch_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_stopwatch_user_id" ON public.stopwatch USING btree (user_id);


--
-- Name: IDX_team_org_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_team_org_id" ON public.team USING btree (org_id);


--
-- Name: IDX_team_repo_org_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_team_repo_org_id" ON public.team_repo USING btree (org_id);


--
-- Name: IDX_team_unit_org_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_team_unit_org_id" ON public.team_unit USING btree (org_id);


--
-- Name: IDX_team_user_org_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_team_user_org_id" ON public.team_user USING btree (org_id);


--
-- Name: IDX_topic_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_topic_created_unix" ON public.topic USING btree (created_unix);


--
-- Name: IDX_topic_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_topic_updated_unix" ON public.topic USING btree (updated_unix);


--
-- Name: IDX_tracked_time_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_tracked_time_issue_id" ON public.tracked_time USING btree (issue_id);


--
-- Name: IDX_tracked_time_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_tracked_time_user_id" ON public.tracked_time USING btree (user_id);


--
-- Name: IDX_two_factor_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_two_factor_created_unix" ON public.two_factor USING btree (created_unix);


--
-- Name: IDX_two_factor_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_two_factor_updated_unix" ON public.two_factor USING btree (updated_unix);


--
-- Name: IDX_u2f_registration_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_u2f_registration_created_unix" ON public.u2f_registration USING btree (created_unix);


--
-- Name: IDX_u2f_registration_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_u2f_registration_updated_unix" ON public.u2f_registration USING btree (updated_unix);


--
-- Name: IDX_u2f_registration_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_u2f_registration_user_id" ON public.u2f_registration USING btree (user_id);


--
-- Name: IDX_user_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_user_created_unix" ON public."user" USING btree (created_unix);


--
-- Name: IDX_user_is_active; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_user_is_active" ON public."user" USING btree (is_active);


--
-- Name: IDX_user_last_login_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_user_last_login_unix" ON public."user" USING btree (last_login_unix);


--
-- Name: IDX_user_open_id_uid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_user_open_id_uid" ON public.user_open_id USING btree (uid);


--
-- Name: IDX_user_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_user_updated_unix" ON public."user" USING btree (updated_unix);


--
-- Name: IDX_webhook_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_webhook_created_unix" ON public.webhook USING btree (created_unix);


--
-- Name: IDX_webhook_is_active; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_webhook_is_active" ON public.webhook USING btree (is_active);


--
-- Name: IDX_webhook_org_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_webhook_org_id" ON public.webhook USING btree (org_id);


--
-- Name: IDX_webhook_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_webhook_repo_id" ON public.webhook USING btree (repo_id);


--
-- Name: IDX_webhook_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_webhook_updated_unix" ON public.webhook USING btree (updated_unix);


--
-- Name: UQE_access_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_access_s" ON public.access USING btree (user_id, repo_id);


--
-- Name: UQE_access_token_sha1; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_access_token_sha1" ON public.access_token USING btree (sha1);


--
-- Name: UQE_attachment_uuid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_attachment_uuid" ON public.attachment USING btree (uuid);


--
-- Name: UQE_collaboration_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_collaboration_s" ON public.collaboration USING btree (repo_id, user_id);


--
-- Name: UQE_commit_status_repo_sha_index; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_commit_status_repo_sha_index" ON public.commit_status USING btree (index, repo_id, sha);


--
-- Name: UQE_deleted_branch_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_deleted_branch_s" ON public.deleted_branch USING btree (repo_id, name, commit);


--
-- Name: UQE_deploy_key_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_deploy_key_s" ON public.deploy_key USING btree (key_id, repo_id);


--
-- Name: UQE_email_address_email; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_email_address_email" ON public.email_address USING btree (email);


--
-- Name: UQE_follow_follow; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_follow_follow" ON public.follow USING btree (user_id, follow_id);


--
-- Name: UQE_issue_dependency_issue_dependency; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_issue_dependency_issue_dependency" ON public.issue_dependency USING btree (issue_id, dependency_id);


--
-- Name: UQE_issue_label_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_issue_label_s" ON public.issue_label USING btree (issue_id, label_id);


--
-- Name: UQE_issue_repo_index; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_issue_repo_index" ON public.issue USING btree (repo_id, index);


--
-- Name: UQE_issue_watch_watch; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_issue_watch_watch" ON public.issue_watch USING btree (user_id, issue_id);


--
-- Name: UQE_lfs_meta_object_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_lfs_meta_object_s" ON public.lfs_meta_object USING btree (oid, repository_id);


--
-- Name: UQE_login_source_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_login_source_name" ON public.login_source USING btree (name);


--
-- Name: UQE_org_user_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_org_user_s" ON public.org_user USING btree (uid, org_id);


--
-- Name: UQE_protected_branch_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_protected_branch_s" ON public.protected_branch USING btree (repo_id, branch_name);


--
-- Name: UQE_reaction_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_reaction_s" ON public.reaction USING btree (type, issue_id, comment_id, user_id);


--
-- Name: UQE_release_n; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_release_n" ON public.release USING btree (repo_id, tag_name);


--
-- Name: UQE_repo_redirect_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_repo_redirect_s" ON public.repo_redirect USING btree (owner_id, lower_name);


--
-- Name: UQE_repo_topic_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_repo_topic_s" ON public.repo_topic USING btree (repo_id, topic_id);


--
-- Name: UQE_repository_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_repository_s" ON public.repository USING btree (owner_id, lower_name);


--
-- Name: UQE_star_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_star_s" ON public.star USING btree (uid, repo_id);


--
-- Name: UQE_team_repo_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_team_repo_s" ON public.team_repo USING btree (team_id, repo_id);


--
-- Name: UQE_team_unit_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_team_unit_s" ON public.team_unit USING btree (team_id, type);


--
-- Name: UQE_team_user_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_team_user_s" ON public.team_user USING btree (team_id, uid);


--
-- Name: UQE_topic_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_topic_name" ON public.topic USING btree (name);


--
-- Name: UQE_two_factor_uid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_two_factor_uid" ON public.two_factor USING btree (uid);


--
-- Name: UQE_upload_uuid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_upload_uuid" ON public.upload USING btree (uuid);


--
-- Name: UQE_user_lower_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_user_lower_name" ON public."user" USING btree (lower_name);


--
-- Name: UQE_user_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_user_name" ON public."user" USING btree (name);


--
-- Name: UQE_user_open_id_uri; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_user_open_id_uri" ON public.user_open_id USING btree (uri);


--
-- Name: UQE_watch_watch; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_watch_watch" ON public.watch USING btree (user_id, repo_id);


--
-- PostgreSQL database dump complete
--

