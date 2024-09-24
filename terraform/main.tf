
provider "aws" {
    region = "us-west-1"
}

#ec2 instance
resource "aws_instance" "example" {
    ami           = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"
}