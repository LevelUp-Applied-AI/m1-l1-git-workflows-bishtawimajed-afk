#!/usr/bin/env bash
# تفعيل خاصية التوقف الفوري عند حدوث أي خطأ
set -euo pipefail

echo "Starting automated setup..."

# 1. إنشاء البيئة الافتراضية إذا لم تكن موجودة
if [ ! -d ".venv" ]; then
    python -m venv .venv
    echo "Created virtual environment."
fi

# 2. تفعيل البيئة (متوافق مع Git Bash على ويندوز)
source .venv/Scripts/activate

# 3. تحديث pip وتثبيت المكتبات
pip install --upgrade pip
pip install -r requirements.txt

# 4. تشغيل اختبار البيئة
python test_environment.py

echo "Setup complete."