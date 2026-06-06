# Furniture Catalog Site

A simple static furniture catalog built with plain HTML, CSS, and JavaScript.
No frameworks, no build step — just edit and deploy.

---

## File structure

```
furniture-site/
├── firebase.json          ← Firebase Hosting config (don't edit)
└── public/
    ├── index.html         ← The entire website
    ├── data.json          ← All your furniture items (edit this!)
    └── images/            ← Put your product photos here
```

---

## Adding or editing furniture items

Open `public/data.json` and edit the list. Each item looks like this:

```json
{
  "id": 1,
  "name": "Bergström Sofa",
  "category": "Living Room",
  "price": 12900,
  "description": "A generous 3-seat sofa...",
  "dimensions": "W 225 × D 90 × H 82 cm",
  "materials": "Linen blend, solid oak",
  "image": "images/sofa.jpg",
  "new": true,
  "available": true
}
```

- `id` — must be unique for each item (just increment the number)
- `category` — controls the filter buttons; use the same spelling for items in the same category
- `image` — path to the photo inside the `public/` folder; if the image is missing, a placeholder emoji is shown instead
- `new` — set to `true` to show a "New" badge on the card

---

## Adding product photos

Put your `.jpg` or `.png` files in `public/images/`.
Then set `"image": "images/your-filename.jpg"` in `data.json`.

Recommended photo size: 800 × 600 px, under 200 KB (use squoosh.app to compress).

---

## Setting up the enquiry email

When a visitor clicks "Enquire about this item", the site opens a pre-filled email.
Change `your@email.com` in `index.html` to your real email address:

```js
window.location.href = `mailto:your@email.com?subject=...`;
```

(Search for `mailto:` in `index.html` to find the right line.)

---

## Deploying to Firebase Hosting

### First time

```bash
npm install -g firebase-tools
firebase login
firebase init hosting          # choose "use existing" and pick your project
firebase deploy
```

### Every time you make changes

```bash
firebase deploy
```

### Connect your custom domain

1. Go to Firebase Console → Hosting → Add custom domain
2. Follow the DNS instructions (add the TXT and A records to your domain registrar)
3. Firebase handles the SSL certificate automatically

---

## Customising the site name

Search for `Møbler` in `index.html` and replace it with your shop name.
The font used for the logo is **Cormorant Garamond** (loaded from Google Fonts).
