import json
from pathlib import Path

nb_path = Path(r"c:\Users\gabriel.palomarez\Documents\JupyterNotebook\Portfolio Work\titanic\Data-Projects-Portfolio\Titanic_Data_Project.ipynb")
print('Loading', nb_path)
nb = json.loads(nb_path.read_text(encoding='utf-8'))
changed = False

# Ensure top-level metadata
meta = nb.get('metadata', {})
if 'title' not in meta:
    meta['title'] = 'Titanic Data Project'
    changed = True
if 'authors' not in meta:
    meta['authors'] = [{'name': 'Gabriel Palomarez'}]
    changed = True

# Try to set language_info from first code cell
lang = None
for cell in nb.get('cells', []):
    md = cell.get('metadata', {})
    if md.get('language') == 'python':
        lang = 'python'
        break
if lang:
    if 'language_info' not in meta or meta.get('language_info', {}).get('name') != lang:
        meta['language_info'] = {'name': lang}
        changed = True

nb['metadata'] = meta

# For each cell, ensure metadata.id exists (copy from top-level id if present)
for cell in nb.get('cells', []):
    cell_meta = cell.get('metadata', {})
    # Many cells have a top-level 'id' key (e.g., '#VSC-...')
    top_id = cell.get('id')
    if top_id and cell_meta.get('id') != top_id:
        cell_meta['id'] = top_id
        cell['metadata'] = cell_meta
        changed = True

if changed:
    nb_path.write_text(json.dumps(nb, indent=2, ensure_ascii=False), encoding='utf-8')
    print('Notebook updated')
else:
    print('No changes required')
