terraform {
    backend "s3" {
        bucket = "adrta-terraform-remote-state-mi"
        key = "dev/project/terraform.tfstate"
        region = "us-east-1"
        dynamodb_table= "terraform-locks"
        encrypt = true
    }
}
