

## Checkout in another folder

    git archive tag-name --prefix="tag-name/" | tar -xv

Exapmple

    mkdir /tmp/xyz
    git archive master | tar -x -C /tmp/xyz

