# Homebrew Tap for HybriSight

```bash
brew tap agapii/hybrisight
brew install hybrisight
```

This tap provides the HybriSight CLI for macOS users.

## Updating the formula

When releasing a new version:

1. Get the SHA256 of the new source distribution:
```bash
curl -s https://pypi.org/pypi/hybrisight/NEW_VERSION/json | python3 -c 'import sys,json; d=json.load(sys.stdin); [print(u["digests"]["sha256"]) for u in d["urls"] if u["packagetype"]=="sdist"]'
```

2. Update `Formula/hybrisight.rb`:
   - Change `url` to the new version
   - Update `sha256`

3. Commit and push:
```bash
git add Formula/hybrisight.rb
git commit -m "hybrisight: update to vNEW_VERSION"
git push
```
