resource "aws_rds_cluster_instance" "cluster_instances" {
  count              = "${var.read_replica_count + 1}"
  identifier         = "aurora-cluster-instance-${count.index}"
  cluster_identifier = "${aws_rds_cluster.default.id}"
  instance_class     = "db.t2.small"

}

resource "aws_rds_cluster" "default" {
  cluster_identifier = "aurora-cluster-demo"
  database_name      = "mydb"
  master_username    = "foo"
  master_password    = "barbut8chars"
  skip_final_snapshot = true
}