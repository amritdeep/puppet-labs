class dashboard::java {

  package { "openjdk-7-jdk": 
    ensure  => present 
  }

  package { "maven": 
    ensure  => present,
    require => Package["openjdk-7-jdk"]
  }
  
}