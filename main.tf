terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
 
provider "aws" {
  region = "ap-south-1"
}
 
resource "aws_iam_user" "jenkins_user" {
  name = "SYED-jenkins"
  tags = {
    "description" = "Created by Jenkins"
  }
}
 
resource "aws_iam_policy" "jenkins_policy" {
  name   = "AdminUsers-jenkins"
  policy = file("admin-policy.json")
}
 
resource "aws_iam_user_policy_attachment" "jenkins_attach" {
  user       = aws_iam_user.jenkins_user.name
  policy_arn = aws_iam_policy.jenkins_policy.arn
}
