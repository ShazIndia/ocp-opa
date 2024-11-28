package kubernetes.admission

import data.kubernetes.admission

# Test when the resource has no "owner" label, expecting a violation.
test_no_label {
    violations := data.kubernetes.admission.violation with input as {
        "review": {
            "object": {"metadata": {"labels": {}}}
        }
    }
    count(violations) == 1
    violations[0] == "All resources must have an 'owner' label."
}

# Test when the resource has the "owner" label, expecting no violation.
test_with_label {
    violations := data.kubernetes.admission.violation with input as {
        "review": {
            "object": {"metadata": {"labels": {"owner": "team1"}}}
        }
    }
    count(violations) == 0
}

