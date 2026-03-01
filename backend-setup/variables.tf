variable "region" {
    default = "us-east-1"
}
variable "bucket_name" {
    default = "adrta-terraform-remote-state-mi"
}
variable "lock_table" {
    default = "terraform-locks"
}
variable "environment" {
    default = "dev"
}