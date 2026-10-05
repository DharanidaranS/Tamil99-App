const fs = require('fs');

const dashHTML = fs.readFileSync('tamil99_suite_dashboard_ultra_premium/index.html', 'utf8');

const bannerStartStr = '<!-- Top Greeting & Grand Hero Banner with Royal Kolam & Golden Certification -->';
const bannerEndStr = '<!-- Elegant Tamil Watermark Stamp in gold shimmer -->\r\n<div aria-hidden="true" class="absolute -right-4 -bottom-10 pointer-events-none select-none opacity-10 text-[140px] font-black text-[#d4af37] leading-none tracking-tighter">\r\n            தமிழ்\r\n          </div>\r\n</div>';
const bannerEndStrUnix = '<!-- Elegant Tamil Watermark Stamp in gold shimmer -->\n<div aria-hidden="true" class="absolute -right-4 -bottom-10 pointer-events-none select-none opacity-10 text-[140px] font-black text-[#d4af37] leading-none tracking-tighter">\n            தமிழ்\n          </div>\n</div>';

let startIdx = dashHTML.indexOf(bannerStartStr);
let endIdx = dashHTML.indexOf(bannerEndStr);
if (endIdx === -1) {
    endIdx = dashHTML.indexOf(bannerEndStrUnix);
    if (endIdx !== -1) {
        endIdx += bannerEndStrUnix.length;
    }
} else {
    endIdx += bannerEndStr.length;
}

if (startIdx === -1 || endIdx === -1) {
    console.error('Could not extract hero banner');
    process.exit(1);
}

const heroBanner = dashHTML.substring(startIdx, endIdx);

const targetFile = 'tamil99_suite_typing_studio_ultra_premium/index.html';
let tsHTML = fs.readFileSync(targetFile, 'utf8');

if (tsHTML.includes(bannerStartStr)) {
    console.log('Banner already exists in ' + targetFile);
    process.exit(0);
}

const insertionPoint = '<!-- Top Operational Mica Hardware Bar -->';
if (tsHTML.indexOf(insertionPoint) === -1) {
    console.error('Insertion point not found');
    process.exit(1);
}

const bannerWithMargin = heroBanner + '\n\n<div class="h-6"></div>\n\n';

tsHTML = tsHTML.replace(insertionPoint, bannerWithMargin + insertionPoint);
fs.writeFileSync(targetFile, tsHTML);
console.log('Successfully injected hero banner.');
