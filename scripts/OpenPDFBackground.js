function run(argv) {
  const frontAppName = Application("System Events").applicationProcesses.whose({
    frontmost: true,
  })[0].name();

  const skim = Application("Skim");
  skim.launch({ launch: true });
  skim.open(argv[0]);
  skim.documents[0].viewSettings = {
    displayMode: "single page",
    autoScales: true,
  };

  Application(frontAppName).activate();
}
