class mail::frontend::commissioned inherits mail::storage::commissioned {
	include mail::frontend::package

	file {
		"${etc_dovecot}/conf.d/20-imap.conf":
			ensure  => file,
			mode    => 0444,
			owner   => root,
			group   => root,
			content => template("mail/storage/conf.d/20-imap.conf.erb"),
			require => File[$etc_dovecot],
		;
		"${etc_dovecot}/conf.d/20-managesieve.conf":
			ensure  => file,
			mode    => 0444,
			owner   => root,
			group   => root,
			content => template("mail/storage/conf.d/20-managesieve.conf.erb"),
			require => File[$etc_dovecot],
		;
	}
}
