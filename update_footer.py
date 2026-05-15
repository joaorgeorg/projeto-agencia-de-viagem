import os
import glob

html_files = glob.glob("*.html")

old_gallery = """                    <div class="row g-2 pt-2">
                        <div class="col-4">
                            <img class="img-fluid bg-light p-1" src="img/package-1.jpg" alt="">
                        </div>
                        <div class="col-4">
                            <img class="img-fluid bg-light p-1" src="img/package-2.jpg" alt="">
                        </div>
                        <div class="col-4">
                            <img class="img-fluid bg-light p-1" src="img/package-3.jpg" alt="">
                        </div>
                        <div class="col-4">
                            <img class="img-fluid bg-light p-1" src="img/package-2.jpg" alt="">
                        </div>
                        <div class="col-4">
                            <img class="img-fluid bg-light p-1" src="img/package-3.jpg" alt="">
                        </div>
                        <div class="col-4">
                            <img class="img-fluid bg-light p-1" src="img/package-1.jpg" alt="">
                        </div>
                    </div>"""

new_gallery = """                    <div class="row g-2 pt-2">
                        <div class="col-4">
                            <img class="img-fluid bg-light p-1 gallery-img" src="img/package-1.jpg" alt="" style="cursor: pointer;">
                        </div>
                        <div class="col-4">
                            <img class="img-fluid bg-light p-1 gallery-img" src="img/package-2.jpg" alt="" style="cursor: pointer;">
                        </div>
                        <div class="col-4">
                            <img class="img-fluid bg-light p-1 gallery-img" src="img/package-3.jpg" alt="" style="cursor: pointer;">
                        </div>
                        <div class="col-4">
                            <img class="img-fluid bg-light p-1 gallery-img" src="img/destination-1.jpg" alt="" style="cursor: pointer;">
                        </div>
                        <div class="col-4">
                            <img class="img-fluid bg-light p-1 gallery-img" src="img/destination-2.jpg" alt="" style="cursor: pointer;">
                        </div>
                        <div class="col-4">
                            <img class="img-fluid bg-light p-1 gallery-img" src="img/destination-3.jpg" alt="" style="cursor: pointer;">
                        </div>
                    </div>"""

for filepath in html_files:
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    if old_gallery in content:
        content = content.replace(old_gallery, new_gallery)
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"Updated {filepath}")
    else:
        print(f"Gallery not found in {filepath} (might be already updated or different formatting)")
