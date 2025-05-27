import json
import os
import subprocess
import shutil

JSON_FILE = "repos.json"
CLONE_DIR = "."
DEFAULT_URL = "https://altlinux.space/{}.git"


def get_remote_commit(repo_url):
    try:
        result = subprocess.check_output(
            ["git", "ls-remote", repo_url, "HEAD"]
        )
        return result.decode("utf-8").split()[0]
    except subprocess.CalledProcessError as e:
        print(f"Ошибка при получении удаленного коммита {repo_url}: {e}")
        return None


def clear_directory(directory):
    if os.path.exists(directory):
        shutil.rmtree(directory)


def clone_or_update_repo(repo, repo_url, clone_path, local_commit):
    try:
        remote_commit = get_remote_commit(repo_url)

        if remote_commit is None:
            print(f"Не удалось получить удаленный коммит для {repo}. Пропуск.")
            return None

        if os.path.exists(clone_path) and local_commit == remote_commit:
            print(f"Репозиторий {repo} уже обновлен. Пропуск.")
            return local_commit

        clear_directory(clone_path)
        subprocess.run(
            ["git", "clone", "--depth", "1", repo_url, clone_path],
            check=True
        )
        os.chdir(clone_path)
        cloned_commit = subprocess.check_output(
            ["git", "rev-parse", "HEAD"]
        ).strip().decode("utf-8")
        git_folder = '.git'
        if os.path.exists(git_folder):
            shutil.rmtree(git_folder)
        os.chdir("..")
        return cloned_commit
    except subprocess.CalledProcessError as e:
        print(f"Ошибка при клонировании/обновлении {repo}: {e}")
        return None


def process_repositories(file_path):
    dir_path = os.path.dirname(os.path.realpath(__file__))
    try:
        with open(file_path, "r", encoding="utf-8") as f:
            data = json.load(f)
        updated = {}
        for repo, commit in data.items():
            print(f"Обработка репозитория: {repo}")
            repo_name = repo.split("/")[-1]
            repo_path = os.path.join(CLONE_DIR, repo_name)
            repo_url = DEFAULT_URL.format(repo)
            new_commit = clone_or_update_repo(
                repo, repo_url,
                repo_path,
                commit,
            )
            if new_commit:
                updated[repo] = new_commit
            else:
                updated[repo] = commit

        os.chdir(dir_path)
        with open(file_path, "w", encoding="utf-8") as f:
            json.dump(updated, f, indent=4, ensure_ascii=False)
            print(f"Обновленный JSON сохранен в {file_path}.")
    except Exception as e:
        print(f"Непредвиденная ошибка: {e}")


if __name__ == "__main__":
    process_repositories(JSON_FILE)
