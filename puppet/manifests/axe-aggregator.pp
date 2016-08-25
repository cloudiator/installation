include wget

file{'/opt/cloudiator/axe-aggregator':
	ensure => 'directory',
}


wget::fetch { "axe-aggregator":
  source      => 'https://omi-dev.e-technik.uni-ulm.de/jenkins/job/cloudiator-axe-aggregator/lastSuccessfulBuild/artifact/service/target/axe-aggregator-service-0.2.0-SNAPSHOT-jar-with-dependencies.jar',
  destination => '/opt/cloudiator/axe-aggregator/axe-aggregator-service-0.2.0-SNAPSHOT-jar-with-dependencies.jar',
  timeout     => 0,
  verbose     => false,
}

notify{"axe-aggregator will only be started if there no /opt/cloudiator/axe-aggregator/axe-aggregator.pid file!":}

exec {'axe-aagregator':

	command => 'nohup java -jar axe-aggregator-service-0.2.0-SNAPSHOT-jar-with-dependencies.jar > /dev/null 2>&1 & echo $! > axe-aggregator.pid',
	cwd => '/opt/cloudiator/axe-aggregator',
	path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],
	creates => '/opt/cloudiator/axe-aggregator/axe-aggregator.pid'

}


