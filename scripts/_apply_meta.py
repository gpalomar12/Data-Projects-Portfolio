import json
from pathlib import Path
p = Path(r"c:\Users\gabriel.palomarez\Documents\JupyterNotebook\Portfolio Work\titanic\Data-Projects-Portfolio\Titanic_Data_Project.ipynb")
nb = json.loads(p.read_text(encoding='utf-8'))
meta = nb.get('metadata', {})
# Merge requested structure
meta.setdefault('title','Titanic Data Project')
meta.setdefault('format','html')
meta.setdefault('jupyter',{})
jp = meta['jupyter']
jp.setdefault('jupytext',{})
jt = jp['jupytext']
jt.setdefault('text_representation',{})
tr = jt['text_representation']
tr.setdefault('extension', '.qmd')
tr.setdefault('format_name','quarto')
nb['metadata'] = meta
p.write_text(json.dumps(nb, indent=2, ensure_ascii=False), encoding='utf-8')
print('Updated notebook metadata')
