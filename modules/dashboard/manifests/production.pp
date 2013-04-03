class dashboard::production {

  notify {"Setting up the production environment":}

  user { "www":
    comment => "Dashboad User",
    home => "/home/www",
    ensure => present,
    shell => "/bin/bash",
  }

  package { "openjdk-7-jdk": 
    ensure => present 
  }

  package { "tomcat7": 
    ensure => present 
  }

  service { "tomcat7": 
    ensure => running 
  }

  package { "nginx": 
    ensure => present 
  }

  service { "nginx": 
    ensure => running 
  }

  file {"logfile":
    path    => "/var/log/nginx/dashboard.access.log",
    ensure  => present,
    mode    => 0644,
  }

  file {"unwanted-default":
    path    => "/etc/nginx/sites-enabled/default",
    ensure  => absent,
  }

  file {"dashboard-avaliable":
    path    => "/etc/nginx/sites-available/dashboard",
    ensure  => present,
    mode    => 0644,
    source  => "puppet:///modules/dashboard/static/dashboard",
    require => File["logfile", "unwanted-default"],
    notify  => "nginx"
  }

  file {"dashboard-enabled":
    path    => "/etc/nginx/sites-enabled/dashboard",
    ensure  => link,
    mode    => 0644,
    target  => "/etc/nginx/sites-available/dashboard",
    require => File["dashboard-avaliable"],
  }


}
