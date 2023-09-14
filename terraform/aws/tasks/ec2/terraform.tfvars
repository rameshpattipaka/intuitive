  ami_id             = "amzn2-ami-hvm-x86_64-gp2"      
  instance_type      = "c5x.large"           
  key_name           = "intuitive"        
  subnet_id          = "subnet-4394429"  
  instance_name      = web_server
  availability_zone  = "us-west-1a"
  ebs_volume_size    = 100
