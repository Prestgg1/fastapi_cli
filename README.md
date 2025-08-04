# FastAPICLI

---

**FastAPICLI** FastAPI layihələrində **təkrarlanan kod yaratma proseslərini avtomatlaşdıran** və inkişafı sürətləndirən yığcam bir Komanda Sətri İnterfeysidir (CLI). Bu köməkçi ilə asanlıqla yeni **modeller, routerlər və seed faylları** yarada, həmçinin mövcud seed-ləri işə sala bilərsiniz.

## Xüsusiyyətlər

* **Model Yaratma:** Verilənlər bazası modellərinizi (Pydantic modelləri və ya ORM obyektləri) tez bir zamanda yaradın.
* **Router Yaratma:** Yeni API marşrutlarını və onların endpointlərini asanlıqla qurun.
* **Seed Fayl Yaratma:** Test verilənləri və ya ilkin məlumatları bazanıza əlavə etmək üçün seed faylları hazırlayın.
* **Seed Fayllarını İcra Etmə:** Yaradılmış seed fayllarını birbaşa CLI vasitəsilə işə salın.

---

## Başlamaq

**FastAPICLI**-dan istifadə etmək üçün **`fastapi_cli.exe`** icra edilə bilən faylını yükləmək kifayətdir. Quraşdırmaya ehtiyac yoxdur!

1.  **`fastapi_cli.exe` faylını yükləyin:**
    Ən son versiyanı [**Buradan Yükləyin**](https://github.com/prestgg/FastAPICLI/releases/latest/download/fastapi_cli.exe).
2.  **İcra Edin:**
    Yüklədiyiniz **`fastapi_cli.exe`** faylını istədiyiniz qovluğa yerləşdirin və əmrlər sətrində (Command Prompt/Terminal) həmin qovluğa keçərək işə salın:

    ```bash
    ./fastapi_cli.exe --help
    ```
    *(Qeyd: Əgər siz Linux və ya macOS istifadəçisisinizsə və Wine kimi bir uyğunluq qatı ilə çalışırsınızsa, `wine fastapi_cli.exe --help` istifadə etməli ola bilərsiniz. CLI əsasən Windows üçün nəzərdə tutulub.)*

---

## İstifadə

**FastAPICLI**-nin əsas komandaları və istifadə nümunələri aşağıdakılardır:

Əmrlərin tam siyahısını görmək üçün **`fastapi_cli.exe`** faylını heç bir arqument olmadan işə salın:

```bash
fastapi_cli.exe

📘 İstifadə qaydası:
  fastapi_cli <əmr> [parametrlər]

✨ Nümunələr:
  fastapi_cli create:model User

  fastapi_cli create:router User

  fastapi_cli create:seed User

  fastapi_cli run:seed User

ℹ️ Mövcud əmrləri görmək üçün sənədlərə baxın.

