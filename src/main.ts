import { PrismaClient } from ".prisma/client";

const db = new PrismaClient({
  log: ["query"],
});

async function main() {
  const foos = await db.foo.findMany({
    where: {
      bar: {
        is: null,
      },
    },
  });

  console.log({ foos });
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
