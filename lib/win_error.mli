(** manipulate Windows system errors

If your application is likely to run on Windows, simply replace uses of
{!Unix.error_message} with {!Win_error.error_message}. When the application
runs on Windows, Windows system errors will be decoded; when the application
runs elsewhere then the existing {!Unix.error_message} function is
called transparently.

Errors are typically first thrown by the OCaml standard library as {!Unix.Unix_error}
exceptions. In some cases these are mapped onto their Unix equivalents on
such as {!Unix.ENOENT}, but when the code isn't recognised OCaml will raise
{!Unix.EUNKNOWNERR} (-code). This library is able to convert these codes back
into human-readable strings. *)

type t =
  | Success
  | Invalid_function
  | File_not_found
  | Path_not_found
  | Too_many_open_files
  | Access_denied
  | Invalid_handle
  | Arena_trashed
  | Not_enough_memory
  | Invalid_block
  | Bad_environment
  | Bad_format
  | Invalid_access
  | Invalid_data
  | Outofmemory
  | Invalid_drive
  | Current_directory
  | Not_same_device
  | No_more_files
  | Write_protect
  | Bad_unit
  | Not_ready
  | Bad_command
  | Crc
  | Bad_length
  | Seek
  | Not_dos_disk
  | Sector_not_found
  | Out_of_paper
  | Write_fault
  | Read_fault
  | Gen_failure
  | Sharing_violation
  | Lock_violation
  | Wrong_disk
  | Sharing_buffer_exceeded
  | Handle_eof
  | Handle_disk_full
  | Not_supported
  | Rem_not_list
  | Dup_name
  | Bad_netpath
  | Network_busy
  | Dev_not_exist
  | Too_many_cmds
  | Adap_hdw_err
  | Bad_net_resp
  | Unexp_net_err
  | Bad_rem_adap
  | Printq_full
  | No_spool_space
  | Print_cancelled
  | Netname_deleted
  | Network_access_denied
  | Bad_dev_type
  | Bad_net_name
  | Too_many_names
  | Too_many_sess
  | Sharing_paused
  | Req_not_accep
  | Redir_paused
  | File_exists
  | Cannot_make
  | Fail_I24
  | Out_of_structures
  | Already_assigned
  | Invalid_password
  | Invalid_parameter
  | Net_write_fault
  | No_proc_slots
  | Too_many_semaphores
  | Excl_sem_already_owned
  | Sem_is_set
  | Too_many_sem_requests
  | Invalid_at_interrupt_time
  | Sem_owner_died
  | Sem_user_limit
  | Disk_change
  | Drive_locked
  | Broken_pipe
  | Open_failed
  | Buffer_overflow
  | Disk_full
  | No_more_search_handles
  | Invalid_target_handle
  | Invalid_category
  | Invalid_verify_switch
  | Bad_driver_level
  | Call_not_implemented
  | Sem_timeout
  | Insufficient_buffer
  | Invalid_name
  | Invalid_level
  | No_volume_label
  | Mod_not_found
  | Proc_not_found
  | Wait_no_children
  | Child_not_complete
  | Direct_access_handle
  | Negative_seek
  | Seek_on_device
  | Is_join_target
  | Is_joined
  | Is_substed
  | Not_joined
  | Not_substed
  | Join_to_join
  | Subst_to_subst
  | Join_to_subst
  | Subst_to_join
  | Busy_drive
  | Same_drive
  | Dir_not_root
  | Dir_not_empty
  | Is_subst_path
  | Is_join_path
  | Path_busy
  | Is_subst_target
  | System_trace
  | Invalid_event_count
  | Too_many_muxwaiters
  | Invalid_list_format
  | Label_too_long
  | Too_many_tcps
  | Signal_refused
  | Discarded
  | Not_locked
  | Bad_threadid_addr
  | Bad_arguments
  | Bad_pathname
  | Signal_pending
  | Max_thrds_reached
  | Lock_failed
  | Busy
  | Device_support_in_progress
  | Cancel_violation
  | Atomic_locks_not_supported
  | Invalid_segment_number
  | Invalid_ordinal
  | Already_exists
  | Invalid_flag_number
  | Sem_not_found
  | Error_invalid_starting_codeseg
  | Invalid_stackseg
  | Invalid_moduletype
  | Invalid_exe_signature
  | Exe_marked_invalid
  | Bad_exe_format
  | Iterated_data_exceeds_64k
  | Invalid_minallocsize
  | Dynlink_from_invalid_ring
  | Iopl_not_enabled
  | Invalid_segdpl
  | Autodataseg_exceeds_64k
  | Ring2seg_must_be_movable
  | Reloc_chain_xeeds_seglim
  | Infloop_in_reloc_chain
  | Envvar_not_found
  | No_signal_sent
  | Filename_exced_range
  | Ring2_stack_in_use
  | Meta_expansion_too_long
  | Invalid_signal_number
  | Thread_1_inactive
  | Locked
  | Too_many_modules
  | Nesting_not_allowed
  | Exe_machine_type_mismatch
  | Exe_cannot_modify_signed_binary
  | Exe_cannot_modify_strong_signed_binary
  | File_checked_out
  | Checkout_required
  | Bad_file_type
  | File_too_large
  | Forms_auth_required
  | Virus_infected
  | Virus_deleted
  | Pipe_local
  | Bad_pipe
  | Pipe_busy
  | No_data
  | Pipe_not_connected
  | More_data
  | Vc_disconnected
  | Invalid_ea_name
  | Ea_list_inconsistent
  | Wait_timeout
  | No_more_items
  | Cannot_copy
  | Directory
  | Eas_didnt_fit
  | Ea_file_corrupt
  | Ea_table_full
  | Invalid_ea_handle
  | Eas_not_supported
  | Not_owner
  | Too_many_posts
  | Partial_copy
  | Oplock_not_granted
  | Invalid_oplock_protocol
  | Disk_too_fragmented
  | Delete_pending
  | Incompatible_with_global_short_name_registry_setting
  | Short_names_not_enabled_on_volume
  | Security_stream_is_inconsistent
  | Invalid_lock_range
  | Image_subsystem_not_present
  | Notification_guid_already_defined
  | Invalid_exception_handler
  | Duplicate_privileges
  | No_ranges_processed
  | Not_allowed_on_system_file
  | Disk_resources_exhausted
  | Invalid_token
  | Device_feature_not_supported
  | Mr_mid_not_found
  | Scope_not_found
  | Undefined_scope
  | Invalid_cap
  | Device_unreachable
  | Device_no_resources
  | Data_checksum_error
  | Intermixed_kernel_ea_operation
  | File_level_trim_not_supported
  | Offset_alignment_violation
  | Invalid_field_in_parameter_list
  | Operation_in_progress
  | Bad_device_path
  | Too_many_descriptors
  | Scrub_data_disabled
  | Not_redundant_storage
  | Resident_file_not_supported
  | Compressed_file_not_supported
  | Directory_not_supported
  | Not_read_from_copy
  | Fail_noaction_reboot
  | Fail_shutdown
  | Fail_restart
  | Max_sessions_reached
  | Thread_mode_already_background
  | Thread_mode_not_background
  | Process_mode_already_background
  | Process_mode_not_background
  | Invalid_address
(** A subset of the Windows system errors from GetLastError *)

val of_unix_error: Unix.error -> t option
(** Convert a unix error into a specific Windows system error, or return None
    if we don't recognise it. None means that the error list should be expanded.
    @see https://msdn.microsoft.com/en-us/library/windows/desktop/ms681382(v=vs.85).aspx full error code list *)

val to_string: t -> string
(** [to_string t] will convert the error [t] into a short printable string *)

val pp : Format.formatter -> t -> unit [@@ocaml.toplevel_printer]
(** [pp fmt t] will output a printable string representation of [t] to formatter [fmt] *)

val error_message: Unix.error -> string
(** A wrapper of [Unix.error_message] which also understands Windows system errors.

    If called on a Win32 system, this will decode Unix.EUNKNOWNERR values as Windows
    system errors. If called on other systems, it simply calls {!Unix.error_message}.
 *)
