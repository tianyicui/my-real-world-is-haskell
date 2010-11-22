suffixes xs@(_:xs') = xs : suffixes xs'
suffixes _ = []
