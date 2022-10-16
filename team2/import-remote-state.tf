data "terraform_remote_state" "remote" {
  backend = "s3"
  config = {
    bucket = "chitti7702"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
