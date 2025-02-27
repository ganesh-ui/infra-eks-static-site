env               = "staging"
region            = "us-east-1"
instance_type     = "t2.micro"
vpc_cidr          = "10.1.0.0/16"
public_subnets    = ["10.1.101.0/24", "10.1.102.0/24"]
private_subnets   = ["10.1.1.0/24", "10.1.2.0/24"]
availability_zones = ["us-east-1a", "us-east-1b"]
security_groups   = ["sg-yyyyyyyyyyyy"]
