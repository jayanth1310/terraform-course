variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-0d729a60"
  }
}

variable "instances" {
  type = int 
  default = 50
}
variable "data"{
  default = "s3://buckets-of-data"
  type= string
}

variable "maps_of_data_sources"{
  type = map
  default = { ami = "ami-01298392", name = "snowflake" }
}
