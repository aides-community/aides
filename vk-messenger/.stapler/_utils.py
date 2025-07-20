import subprocess

def get_field(field: str) -> str:
    return subprocess.check_output(['alr-spec', 'get-field', field]).decode().strip()

def set_field(field: str, value: str):
    subprocess.check_call(['alr-spec', 'set-field', str(field), str(value)])

def get_etag_lastmod(r):
    return r.headers.get('ETag', '').strip('"'), r.headers.get('Last-Modified', '')