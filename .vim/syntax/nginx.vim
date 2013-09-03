" Vim syntax file
" Language: nginx.conf

if exists("b:current_syntax")
  finish
end

setlocal iskeyword+=.
setlocal iskeyword+=/
setlocal iskeyword+=:

syn match ngxVariable '\$\w\w*'
syn match ngxVariableBlock '\$\w\w*' contained
syn match ngxVariableString '\$\w\w*' contained
syn region ngxBlock start=+^+ end=+{+ contains=ngxComment,ngxDirectiveBlock,ngxVariableBlock,ngxString oneline
syn region ngxString start=+"+ end=+"+ skip=+\\\\\|\\"+ contains=ngxVariableString oneline
syn region ngxString start=+'+ end=+'+ skip=+\\\\\|\\'+ contains=ngxVariableString oneline
syn match ngxComment ' *#.*$'

syn keyword ngxBoolean on
syn keyword ngxBoolean off

syn keyword ngxDirectiveBlock http         contained
syn keyword ngxDirectiveBlock mail         contained
syn keyword ngxDirectiveBlock events       contained
syn keyword ngxDirectiveBlock server       contained
syn keyword ngxDirectiveBlock types        contained
syn keyword ngxDirectiveBlock location     contained
syn keyword ngxDirectiveBlock upstream     contained
syn keyword ngxDirectiveBlock charset_map  contained
syn keyword ngxDirectiveBlock limit_except contained
syn keyword ngxDirectiveBlock if           contained
syn keyword ngxDirectiveBlock geo          contained
syn keyword ngxDirectiveBlock map          contained

syn keyword ngxDirectiveImportant include
syn keyword ngxDirectiveImportant root
syn keyword ngxDirectiveImportant server
syn keyword ngxDirectiveImportant server_name
syn keyword ngxDirectiveImportant listen
syn keyword ngxDirectiveImportant internal
syn keyword ngxDirectiveImportant proxy_pass
syn keyword ngxDirectiveImportant memcached_pass
syn keyword ngxDirectiveImportant fastcgi_pass
syn keyword ngxDirectiveImportant try_files

syn keyword ngxDirectiveControl break
syn keyword ngxDirectiveControl return
syn keyword ngxDirectiveControl rewrite
syn keyword ngxDirectiveControl set

syn keyword ngxDirectiveError error_page
syn keyword ngxDirectiveError post_action

syn keyword ngxDirectiveDeprecated connections
syn keyword ngxDirectiveDeprecated imap
syn keyword ngxDirectiveDeprecated open_file_cache_retest
syn keyword ngxDirectiveDeprecated optimize_server_names
syn keyword ngxDirectiveDeprecated satisfy_any

syn keyword ngxDirective accept_mutex
syn keyword ngxDirective accept_mutex_delay
syn keyword ngxDirective access_log
syn keyword ngxDirective add_after_body
syn keyword ngxDirective add_before_body
syn keyword ngxDirective add_header
syn keyword ngxDirective addition_types
syn keyword ngxDirective aio
syn keyword ngxDirective alias
syn keyword ngxDirective allow
syn keyword ngxDirective ancient_browser
syn keyword ngxDirective ancient_browser_value
syn keyword ngxDirective auth_basic
syn keyword ngxDirective auth_basic_user_file
syn keyword ngxDirective auth_http
syn keyword ngxDirective auth_http_header
syn keyword ngxDirective auth_http_timeout
syn keyword ngxDirective autoindex
syn keyword ngxDirective autoindex_exact_size
syn keyword ngxDirective autoindex_localtime
syn keyword ngxDirective charset
syn keyword ngxDirective charset_types
syn keyword ngxDirective client_body_buffer_size
syn keyword ngxDirective client_body_in_file_only
syn keyword ngxDirective client_body_in_single_buffer
syn keyword ngxDirective client_body_temp_path
syn keyword ngxDirective client_body_timeout
syn keyword ngxDirective client_header_buffer_size
syn keyword ngxDirective client_header_timeout
syn keyword ngxDirective client_max_body_size
syn keyword ngxDirective connection_pool_size
syn keyword ngxDirective create_full_put_path
syn keyword ngxDirective daemon
syn keyword ngxDirective dav_access
syn keyword ngxDirective dav_methods
syn keyword ngxDirective debug_connection
syn keyword ngxDirective debug_points
syn keyword ngxDirective default_type
syn keyword ngxDirective degradation
syn keyword ngxDirective degrade
syn keyword ngxDirective deny
syn keyword ngxDirective devpoll_changes
syn keyword ngxDirective devpoll_events
syn keyword ngxDirective directio
syn keyword ngxDirective directio_alignment
syn keyword ngxDirective empty_gif
syn keyword ngxDirective env
syn keyword ngxDirective epoll_events
syn keyword ngxDirective error_log
syn keyword ngxDirective eventport_events
syn keyword ngxDirective expires
syn keyword ngxDirective fastcgi_bind
syn keyword ngxDirective fastcgi_buffer_size
syn keyword ngxDirective fastcgi_buffers
syn keyword ngxDirective fastcgi_busy_buffers_size
syn keyword ngxDirective fastcgi_cache
syn keyword ngxDirective fastcgi_cache_key
syn keyword ngxDirective fastcgi_cache_methods
syn keyword ngxDirective fastcgi_cache_min_uses
syn keyword ngxDirective fastcgi_cache_path
syn keyword ngxDirective fastcgi_cache_use_stale
syn keyword ngxDirective fastcgi_cache_valid
syn keyword ngxDirective fastcgi_catch_stderr
syn keyword ngxDirective fastcgi_connect_timeout
syn keyword ngxDirective fastcgi_hide_header
syn keyword ngxDirective fastcgi_ignore_client_abort
syn keyword ngxDirective fastcgi_ignore_headers
syn keyword ngxDirective fastcgi_index
syn keyword ngxDirective fastcgi_intercept_errors
syn keyword ngxDirective fastcgi_max_temp_file_size
syn keyword ngxDirective fastcgi_next_upstream
syn keyword ngxDirective fastcgi_param
syn keyword ngxDirective fastcgi_pass_header
syn keyword ngxDirective fastcgi_pass_request_body
syn keyword ngxDirective fastcgi_pass_request_headers
syn keyword ngxDirective fastcgi_read_timeout
syn keyword ngxDirective fastcgi_send_lowat
syn keyword ngxDirective fastcgi_send_timeout
syn keyword ngxDirective fastcgi_split_path_info
syn keyword ngxDirective fastcgi_store
syn keyword ngxDirective fastcgi_store_access
syn keyword ngxDirective fastcgi_temp_file_write_size
syn keyword ngxDirective fastcgi_temp_path
syn keyword ngxDirective fastcgi_upstream_fail_timeout
syn keyword ngxDirective fastcgi_upstream_max_fails
syn keyword ngxDirective flv
syn keyword ngxDirective geoip_city
syn keyword ngxDirective geoip_country
syn keyword ngxDirective google_perftools_profiles
syn keyword ngxDirective gzip
syn keyword ngxDirective gzip_buffers
syn keyword ngxDirective gzip_comp_level
syn keyword ngxDirective gzip_disable
syn keyword ngxDirective gzip_hash
syn keyword ngxDirective gzip_http_version
syn keyword ngxDirective gzip_min_length
syn keyword ngxDirective gzip_no_buffer
syn keyword ngxDirective gzip_proxied
syn keyword ngxDirective gzip_static
syn keyword ngxDirective gzip_types
syn keyword ngxDirective gzip_vary
syn keyword ngxDirective gzip_window
syn keyword ngxDirective if_modified_since
syn keyword ngxDirective ignore_invalid_headers
syn keyword ngxDirective image_filter
syn keyword ngxDirective image_filter_buffer
syn keyword ngxDirective image_filter_jpeg_quality
syn keyword ngxDirective image_filter_transparency
syn keyword ngxDirective imap_auth
syn keyword ngxDirective imap_capabilities
syn keyword ngxDirective imap_client_buffer
syn keyword ngxDirective index
syn keyword ngxDirective ip_hash
syn keyword ngxDirective keepalive_requests
syn keyword ngxDirective keepalive_timeout
syn keyword ngxDirective kqueue_changes
syn keyword ngxDirective kqueue_events
syn keyword ngxDirective large_client_header_buffers
syn keyword ngxDirective limit_conn
syn keyword ngxDirective limit_conn_log_level
syn keyword ngxDirective limit_rate
syn keyword ngxDirective limit_rate_after
syn keyword ngxDirective limit_req
syn keyword ngxDirective limit_req_log_level
syn keyword ngxDirective limit_req_zone
syn keyword ngxDirective limit_zone
syn keyword ngxDirective lingering_time
syn keyword ngxDirective lingering_timeout
syn keyword ngxDirective lock_file
syn keyword ngxDirective log_format
syn keyword ngxDirective log_not_found
syn keyword ngxDirective log_subrequest
syn keyword ngxDirective map_hash_bucket_size
syn keyword ngxDirective map_hash_max_size
syn keyword ngxDirective master_process
syn keyword ngxDirective memcached_bind
syn keyword ngxDirective memcached_buffer_size
syn keyword ngxDirective memcached_connect_timeout
syn keyword ngxDirective memcached_next_upstream
syn keyword ngxDirective memcached_read_timeout
syn keyword ngxDirective memcached_send_timeout
syn keyword ngxDirective memcached_upstream_fail_timeout
syn keyword ngxDirective memcached_upstream_max_fails
syn keyword ngxDirective merge_slashes
syn keyword ngxDirective min_delete_depth
syn keyword ngxDirective modern_browser
syn keyword ngxDirective modern_browser_value
syn keyword ngxDirective msie_padding
syn keyword ngxDirective msie_refresh
syn keyword ngxDirective multi_accept
syn keyword ngxDirective open_file_cache
syn keyword ngxDirective open_file_cache_errors
syn keyword ngxDirective open_file_cache_events
syn keyword ngxDirective open_file_cache_min_uses
syn keyword ngxDirective open_file_cache_valid
syn keyword ngxDirective open_log_file_cache
syn keyword ngxDirective output_buffers
syn keyword ngxDirective override_charset
syn keyword ngxDirective perl
syn keyword ngxDirective perl_modules
syn keyword ngxDirective perl_require
syn keyword ngxDirective perl_set
syn keyword ngxDirective pid
syn keyword ngxDirective pop3_auth
syn keyword ngxDirective pop3_capabilities
syn keyword ngxDirective port_in_redirect
syn keyword ngxDirective postpone_gzipping
syn keyword ngxDirective postpone_output
syn keyword ngxDirective protocol
syn keyword ngxDirective proxy
syn keyword ngxDirective proxy_bind
syn keyword ngxDirective proxy_buffer
syn keyword ngxDirective proxy_buffer_size
syn keyword ngxDirective proxy_buffering
syn keyword ngxDirective proxy_buffers
syn keyword ngxDirective proxy_busy_buffers_size
syn keyword ngxDirective proxy_cache
syn keyword ngxDirective proxy_cache_key
syn keyword ngxDirective proxy_cache_methods
syn keyword ngxDirective proxy_cache_min_uses
syn keyword ngxDirective proxy_cache_path
syn keyword ngxDirective proxy_cache_use_stale
syn keyword ngxDirective proxy_cache_valid
syn keyword ngxDirective proxy_connect_timeout
syn keyword ngxDirective proxy_headers_hash_bucket_size
syn keyword ngxDirective proxy_headers_hash_max_size
syn keyword ngxDirective proxy_hide_header
syn keyword ngxDirective proxy_ignore_client_abort
syn keyword ngxDirective proxy_ignore_headers
syn keyword ngxDirective proxy_intercept_errors
syn keyword ngxDirective proxy_max_temp_file_size
syn keyword ngxDirective proxy_method
syn keyword ngxDirective proxy_next_upstream
syn keyword ngxDirective proxy_pass_error_message
syn keyword ngxDirective proxy_pass_header
syn keyword ngxDirective proxy_pass_request_body
syn keyword ngxDirective proxy_pass_request_headers
syn keyword ngxDirective proxy_read_timeout
syn keyword ngxDirective proxy_redirect
syn keyword ngxDirective proxy_send_lowat
syn keyword ngxDirective proxy_send_timeout
syn keyword ngxDirective proxy_set_body
syn keyword ngxDirective proxy_set_header
syn keyword ngxDirective proxy_ssl_session_reuse
syn keyword ngxDirective proxy_store
syn keyword ngxDirective proxy_store_access
syn keyword ngxDirective proxy_temp_file_write_size
syn keyword ngxDirective proxy_temp_path
syn keyword ngxDirective proxy_timeout
syn keyword ngxDirective proxy_upstream_fail_timeout
syn keyword ngxDirective proxy_upstream_max_fails
syn keyword ngxDirective random_index
syn keyword ngxDirective read_ahead
syn keyword ngxDirective real_ip_header
syn keyword ngxDirective recursive_error_pages
syn keyword ngxDirective request_pool_size
syn keyword ngxDirective reset_timedout_connection
syn keyword ngxDirective resolver
syn keyword ngxDirective resolver_timeout
syn keyword ngxDirective rewrite_log
syn keyword ngxDirective rtsig_overflow_events
syn keyword ngxDirective rtsig_overflow_test
syn keyword ngxDirective rtsig_overflow_threshold
syn keyword ngxDirective rtsig_signo
syn keyword ngxDirective satisfy
syn keyword ngxDirective secure_link_secret
syn keyword ngxDirective send_lowat
syn keyword ngxDirective send_timeout
syn keyword ngxDirective sendfile
syn keyword ngxDirective sendfile_max_chunk
syn keyword ngxDirective server_name_in_redirect
syn keyword ngxDirective server_names_hash_bucket_size
syn keyword ngxDirective server_names_hash_max_size
syn keyword ngxDirective server_tokens
syn keyword ngxDirective set_real_ip_from
syn keyword ngxDirective smtp_auth
syn keyword ngxDirective smtp_capabilities
syn keyword ngxDirective smtp_client_buffer
syn keyword ngxDirective smtp_greeting_delay
syn keyword ngxDirective so_keepalive
syn keyword ngxDirective source_charset
syn keyword ngxDirective ssi
syn keyword ngxDirective ssi_ignore_recycled_buffers
syn keyword ngxDirective ssi_min_file_chunk
syn keyword ngxDirective ssi_silent_errors
syn keyword ngxDirective ssi_types
syn keyword ngxDirective ssi_value_length
syn keyword ngxDirective ssl
syn keyword ngxDirective ssl_certificate
syn keyword ngxDirective ssl_certificate_key
syn keyword ngxDirective ssl_ciphers
syn keyword ngxDirective ssl_client_certificate
syn keyword ngxDirective ssl_crl
syn keyword ngxDirective ssl_dhparam
syn keyword ngxDirective ssl_engine
syn keyword ngxDirective ssl_prefer_server_ciphers
syn keyword ngxDirective ssl_protocols
syn keyword ngxDirective ssl_session_cache
syn keyword ngxDirective ssl_session_timeout
syn keyword ngxDirective ssl_verify_client
syn keyword ngxDirective ssl_verify_depth
syn keyword ngxDirective starttls
syn keyword ngxDirective stub_status
syn keyword ngxDirective sub_filter
syn keyword ngxDirective sub_filter_once
syn keyword ngxDirective sub_filter_types
syn keyword ngxDirective tcp_nodelay
syn keyword ngxDirective tcp_nopush
syn keyword ngxDirective thread_stack_size
syn keyword ngxDirective timeout
syn keyword ngxDirective timer_resolution
syn keyword ngxDirective types_hash_bucket_size
syn keyword ngxDirective types_hash_max_size
syn keyword ngxDirective underscores_in_headers
syn keyword ngxDirective uninitialized_variable_warn
syn keyword ngxDirective use
syn keyword ngxDirective user
syn keyword ngxDirective userid
syn keyword ngxDirective userid_domain
syn keyword ngxDirective userid_expires
syn keyword ngxDirective userid_mark
syn keyword ngxDirective userid_name
syn keyword ngxDirective userid_p3p
syn keyword ngxDirective userid_path
syn keyword ngxDirective userid_service
syn keyword ngxDirective valid_referers
syn keyword ngxDirective variables_hash_bucket_size
syn keyword ngxDirective variables_hash_max_size
syn keyword ngxDirective worker_connections
syn keyword ngxDirective worker_cpu_affinity
syn keyword ngxDirective worker_priority
syn keyword ngxDirective worker_processes
syn keyword ngxDirective worker_rlimit_core
syn keyword ngxDirective worker_rlimit_nofile
syn keyword ngxDirective worker_rlimit_sigpending
syn keyword ngxDirective worker_threads
syn keyword ngxDirective working_directory
syn keyword ngxDirective xclient
syn keyword ngxDirective xml_entities
syn keyword ngxDirective xslt_stylesheet
syn keyword ngxDirective xslt_types

" 3rd party module list:
" http://wiki.nginx.org/Nginx3rdPartyModules


