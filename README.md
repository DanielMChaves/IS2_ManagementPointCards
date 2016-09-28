# Management Point Cards

**Asignatura:** Ingeniería del Software II

**Curso:** 2016/2017

**Autores:** [Daniel Melero Chaves] (https://github.com/DanielMChaves), [Miguel Nuñez Díaz-Montes] (https://github.com/mnunezdm), [Javier Ruiz Calle] (https://github.com/javiruiz01), [Irene Sabina Hidalgo] (https://github.com/Psicopotato) y [Carlos Saito Murata] (https://github.com/exacs)

**Lenguajes:** MySQL, ...

**Enunciado:** 

1. Introducción:

  El  objetivo  de  este  documento  es  realizar  el  Análisis  de  Necesidades  del  Sistema TARJETA, que  permitirá  extraer  las        funciones  de  alto  nivel  a  desarrollar  y,  en  base  a  ello,  la  estrategia  de desarrollo  a    seguir  y,  más  concretamente,  la  estimación  preliminar  de  tamaño  y  de  tiempo  de desarrollo del sistema.

2. Análisis de Necesidades:

  1.  Planteamiento del Sistema
  
  La empresa IS_II, con multitud de tiendas asociadas, se dispone a  sacar al mercado una nueva tarjeta  de  fidelización  de  clientes.  Al  realizar  compras  en  cualquiera  de  sus  tiendas  asociadas, los clientes acumularán puntos en su tarjeta que podrán canjear por premios que la empresa irá ofertando periódicamente. Para  automatizar  la  gestión  de  las  tarjetas,  la  empresa  ha  decidido  desarrollar  un  sistema informático  denominado TARJETA.  Para  mantener  un  espíritu  de  protección  del medioambiente  se  pretende  que  se  ofrezca  una  alternativa  telemática  a  los  formularios  de entrada  de  datos  y  a  los  informes  y  listados  potenciales  consumidores  de  papel.  Además  el sistema  debe  de  cumplir  con  los  requerimientos  de  la  legislación  vigente  en  materia  de protección de datos personales. El  funcionamiento del sistema se describe a continuación.

  **•   Gestión de Tarjetas:** Cualquier  cliente  podrá  solicitar  una  nueva  tarjeta.  Para  ello,  deberá  cumplimentar  el correspondiente formulario de solicitud con sus datos personales: nombre, apellidos, dirección, teléfono  y  e-mail.  Cuando  el  sistema  procese  la  solicitud,  asignará  al  cliente  un  nuevo  número de  tarjeta,  y  la  tarjeta  será  emitida  y  enviada  al  cliente.  Se  asume  que  un  cliente  no  puede disponer de más de una tarjeta. Será posible dar de baja una tarjeta, o lo que es lo mismo, anularla. Para ello, el cliente deberá cumplimentar el correspondiente formulario de baja indicando el número de su tarjeta. Cuando el sistema procese la baja, la tarjeta será marcada como anulada, quedando inservible. De la misma manera, por medio de un formulario de modificación, el cliente podrá rectificar los datos asociados a su tarjeta, como por ejemplo su dirección, teléfono o e-mail. A efectos de operatividad, el sistema generará listados de tarjetas siguiendo diversos criterios.

  **•   Gestión de Compras:** Una vez que el cliente reciba la tarjeta, deberá presentarla al realizar sus compras para acumular puntos.  Las  tiendas  enviarán  al  sistema  los  datos  de  la  compra:  identificador  de  la  tienda, número  de  la  tarjeta,  fecha,  hora  e  importe  de  la  compra.  El  sistema  comprobará  que  los  datos de la tienda y de la tarjeta sean correctos y, si es así, acumulará puntos en la tarjeta del cliente en función  del  importe  de  la  compra.  Por  cada  euro  o  fracción  superior  a  medio  euro  el  sistema acumulará  1  punto  en  la  tarjeta.  Así  por  ejemplo,  si  el  importe  de  la  compra  es  de  1,5  euros acumulará 1 punto, pero si es de 1,51 euros acumulará 2 puntos. Cualquier  compra  efectuada  podrá  ser  eliminada  o  modificada,  actualizándose  en  ambos  casos la tarjeta con los puntos a favor o en contra según corresponda. A efectos de operatividad, el sistema generará listados de compras siguiendo diversos criterios.

  **•  Gestión de Premios:** La  dirección  de  la  empresa  introducirá  periódicamente  en  el  sistema  los  datos  de  los  premios que  oferta  para  que  sean  canjeados  por  los  puntos  acumulados.  Por  cada  premio,  indicará  el concepto, la cantidad y los puntos necesarios para su obtención. En función de la gestión del negocio, será posible en cualquier momento retirar un premio de la promoción, así como alterar su coste de puntos. A efectos de operatividad, el sistema generará listados de premios siguiendo diversos criterios.

  **•  Gestión de Canjeos:** Para  solicitar  un  premio,  el  cliente  deberá  cumplimentar  el  correspondiente  formulario  de solicitud  indicando  su  número  de  tarjeta  y  el  concepto  del  premio  por  el  que  desea  optar. Cuando el sistema procese la solicitud, comprobará que la tarjeta del cliente dispone de puntos acumulados  suficientes  para  canjear  por  el  premio,  en  cuyo  caso  el  premio  será  enviado  al cliente y se decrementará consecuentemente la cuenta de puntos de su tarjeta. Cualquier canjeo efectuado podrá ser eliminado o modificado, actualizándose en ambos casos la tarjeta con los puntos a favor o en contra según corresponda. A efectos de operatividad, el sistema generará listados de canjeos siguiendo diversos criterios.

  **•  Gestión de Tiendas:** La  gestión  de  las  tiendas  que  se  acojan  a  este  programa  de  fidelización  también  será responsabilidad del sistema. Ello incluye altas, bajas, modificaciones, y generación de listados a efectos de operatividad.

  **•   Generación de Informes:** El  sistema  enviará  al  cliente  mensualmente  un  listado  con  los  premios  vigentes  a  canjear,  de manera que puedan ser canjeados por puntos en cualquier momento. Asimismo,  el  sistema  enviará  al  cliente  mensualmente  un  informe  con  todos  los  movimientos (compras y canjeos) que ha realizado con su tarjeta durante el mes y la cuenta vigente de puntos. El sistema emitirá mensualmente para la dirección de la empresa un informe global de tarjetas. En  el  informe  se  indicará,  por  cada  tarjeta,  el  cliente  al  que  pertenece,  la  cantidad  de  dinero gastado  en  compras  durante  el  mes,  la  cantidad  de  puntos  acumulados  durante  el  mes,    los canjeos tramitados durante el mes y la cuenta vigente de puntos.
