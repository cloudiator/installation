class { '::mysql::server':

	root_password  	=> 'strongpassword',
	databases 		=> {
							'colosseum' => {
							ensure  => 'present',
							charset => 'utf8',
							},
						}
}
