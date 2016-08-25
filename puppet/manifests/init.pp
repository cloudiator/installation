#class init {

	if $osfamily == 'Debian' {

		case $operatingsystemrelease{
			'7': {include java8}
			'12.04': {include java8}
			'14.04': {include java8}
		}
	}else{
		include java
		java::oracle{ 'jdk8':
			ensure => 'present',
		       version => '8',
		       java_se => 'jre',
		}
	}

	notify{"Running $osfamily version  $operatingsystemrelease":}

	package{'maven':
		ensure => installed,
	}


	package{'git':
		ensure => installed,
	}

	package{'unzip':
		ensure => installed,
	}
	
	file{"/opt/cloudiator":
		ensure => directory,
		mode => '0750',
	
	}
	    
#  }
