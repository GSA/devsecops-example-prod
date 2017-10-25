provider "aws" {
  region = "${var.region}"
}

data "aws_region" "current" {
  current = true
}

terraform {
  backend "s3" {
  }
}