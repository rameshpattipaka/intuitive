module "intuitive_ec2_instance" {
  source             = "../../aws/modules/ec2"
  ami_id             = var.ami_id       
  instance_type      = varinstance_type           
  key_name           = var.key_name        
  subnet_id          = var.subnet_id    
  instance_name      = var.instance_name
  availability_zone  = var.availability_zone
  ebs_volume_size    = var.ebs_volume_size
}
