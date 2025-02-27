env               = "dev"
region            = "us-east-1"
instance_type     = "t2.micro" 
vpc_cidr          = "10.0.0.0/16"
public_subnets    = ["10.0.101.0/24", "10.0.102.0/24"]
private_subnets   = ["10.0.1.0/24", "10.0.2.0/24"]
availability_zones = ["us-east-1a", "us-east-1b"]
security_groups   = ["sg-xxxxxxxxxxxx"]
