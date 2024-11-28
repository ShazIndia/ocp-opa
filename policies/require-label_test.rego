package kubernetes.admission

test_no_label {
    violations := violation with input as {
        "review": {
            "object": {"metadata": {"labels": {}}}
        }
    }
    count(violations) == 1
    violations[0].msg == "All resources must have an 'owner' label."
}

test_with_label {
    violations := violation with input as {
        "review": {
            "object": {"metadata": {"labels": {"owner": "team1"}}}
        }
    }
    count(violations) == 0
}
