# output "instanance_public_ip" {
#    value = aws_instance.my_ec2.public_ip
# }


# Conditional Expressions & Locals
# output "instance_name_tag" {
#    value = local.name_tag
# }
# Depends On
# output "bucket_name" {
#     value = aws_s3_bucket.my_bucket.id
# }

# Module
output "workspace_name" {
  value = terraform.workspace
}