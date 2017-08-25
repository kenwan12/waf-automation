# This will create a single instance based on data from hiera

ec2_securitygroup { 'hiera-test':
  ensure      => present,
  region      => hiera('region'),
  description => 'Group used for testing Puppet AWS module',
}

ec2_instance { 'auto-init-waf-instance':
  ensure            => present,
  region            => hiera('region'),
  availability_zone => hiera('availability_zone'),
  image_id          => hiera('ami'),
  instance_type     => 'm3.medium',
  monitoring        => true,
  subnet            => 'ara-web-svr-subnet',
  key_name          => 'aravindan-temp',
  security_groups   => ['hiera-test'],
  tags              => {
    Name => 'auto-waf-instance',
   },
}
