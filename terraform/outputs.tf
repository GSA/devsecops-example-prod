output "aws_az1" {
  value = "${var.aws_az1}"
}
output "aws_az2" {
  value = "${var.aws_az2}"
}
output "private_dns_zone_name" {
  value = "${aws_route53_zone.vpc_private_zone.name}"
}
output "vpc_name" {
  value = "${var.vpc_name}"
}
output "vpc_id" {
  value = "${module.devsecops_vpc.vpc_id}"
}
output "vpc_cidr_block" {
  value = "${module.devsecops_vpc.vpc_cidr_block}"
}
output "app_public_subnet_ids" {
  value = "${module.devsecops_vpc.public_subnets}"
}
output "app_public_subnet_cidrs" {
  value = "${var.app_public_subnet_cidrs}"
}
output "app_private_subnet_ids" {
  value = "${module.devsecops_vpc.private_subnets}"
}
output "app_private_subnet_cidrs" {
  value = "${var.app_private_subnet_cidrs}"
}
output "database_subnet_ids" {
  value = "${module.devsecops_vpc.database_subnets}"
}
output "database_subnet_cidrs" {
  value = "${var.database_subnet_cidrs}"
}
output "database_subnet_group_name" {
  value = "${module.devsecops_vpc.database_subnet_group}"
}
output "default_security_group_id" {
  value = "${module.devsecops_vpc.default_security_group_id}"
}