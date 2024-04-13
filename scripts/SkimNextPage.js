const document = Application("Skim").documents[0];
document.viewSettings = { displayMode: "single page" };

const pageIndex = parseInt(document.currentPage().index());
const nextPageIndex = pageIndex;

if (nextPageIndex < document.pages.length) {
  document.go({ to: document.pages[nextPageIndex] });
}
