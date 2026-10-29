locals {
  # autworkshopcapp1 ... autworkshopcapp<count>
  participants = toset([for i in range(1, var.participant_count + 1) : "${var.participant_prefix}${i}"])
}
