package kubernetes.admission
import rego.v1
import data.kubernetes.admission

# Test when the resource has no "owner" label, expecting a violation
test_no_label {
    violations := data.kubernetes.admission.violation with input as {
        "review": {
            "object": {"metadata": {"labels": {}}}
        }
    }
    count(violations) == 1
    violations[msg]
    msg == {"msg": "All resources must have an 'owner' label."}
}

# Test when the resource has the "owner" label, expecting no violations
test_with_label {
    violations := data.kubernetes.admission.violation with input as {
        "review": {
            "object": {"metadata": {"labels": {"owner": "team1"}}}
        }
    }
    count(violations) == 0
}
