-- CreateTable
CREATE TABLE "Tenant" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Foo" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Bar" (
    "id" TEXT NOT NULL,
    "fooId" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Foo.tenantId_id_unique" ON "Foo"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "Bar.tenantId_id_unique" ON "Bar"("tenantId", "id");

-- CreateIndex
CREATE UNIQUE INDEX "Bar_tenantId_fooId_unique" ON "Bar"("tenantId", "fooId");

-- AddForeignKey
ALTER TABLE "Foo" ADD FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Bar" ADD FOREIGN KEY ("tenantId", "fooId") REFERENCES "Foo"("tenantId", "id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Bar" ADD FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;
