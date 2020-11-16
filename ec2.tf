
data "aws_ami" "foundry-ami" {
  executable_users = ["self"]
  most_recent      = true
  name_regex       = "^foundryvtt0.7.6"
  owners           = ["063843753876"]
}

resource "aws_instance" "foundry" {
  # us-west-2
  ami           = "foundry-ami-"
  instance_type = "t2.micro"
  user_data     = filebase64("${path.module}/startup.sh")
  subnet_id  = aws_default_subnet.default_az1.id
}