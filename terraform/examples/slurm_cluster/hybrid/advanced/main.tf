/**
 * Copyright 2021 SchedMD LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

############
# PROVIDER #
############

provider "google" {
  project = var.project_id
  region  = var.region
}

#################
# SLURM CLUSTER #
#################

module "slurm_cluster" {
  source = "../../../../modules/slurm_cluster"

  cloud_parameters             = var.cloud_parameters
  cluster_name                 = var.cluster_name
  compute_node_groups_defaults = var.compute_node_groups_defaults
  compute_d                    = var.compute_d
  controller_hybrid_config     = var.controller_hybrid_config
  enable_devel                 = var.enable_devel
  enable_hybrid                = true
  jwt_key                      = var.jwt_key
  login_network_storage        = var.login_network_storage
  munge_key                    = var.munge_key
  network_storage              = var.network_storage
  partitions                   = var.partitions
  project_id                   = var.project_id
}

##################
# FIREWALL RULES #
##################

module "slurm_firewall_rules" {
  source = "../../../../modules/slurm_firewall_rules"

  cluster_name = var.cluster_name
  network_name = var.firewall_network_name
  project_id   = var.project_id
}
