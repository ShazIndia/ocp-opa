package kubernetes.admission

# Default deny rule
default allow = false

# Define the violation
violation[{"msg": msg}] {
    # The resource must have metadata.labels.owner
    not input.review.object.metadata.labels.owner
    msg := "All resources must have an 'owner' label."
}

# Allow rule (if no violations)
allow {
    count(violation) == 0
}
