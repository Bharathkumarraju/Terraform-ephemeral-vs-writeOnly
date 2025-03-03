terraform {
  backend "s3" {
    bucket = "trfm-state-storage-bharaths-mumbai20250303001014769800000001"
    key = "nonephemeral"
    use_lockfile = true
    region = "ap-south-1"
  }
}